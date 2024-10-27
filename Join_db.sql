-- create database
create database jounion;
use jounion;
-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'United States', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1439323776, 9596961),
(4, 'Canada', 37742154, 9984670),
(5, 'Australia', 25499884, 7692024);
select *from country;
-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Person_name VARCHAR(100),
    Country_id INT,
    Rating FLOAT,
	FOREIGN KEY (Country_id) REFERENCES Country(Id)
);

INSERT INTO Persons (Id, Person_name, Country_id,Rating) VALUES
(1, 'Alice Smith', 1, 4.7),
(2, 'Raj Kumar', 2, 3.9),
(3, 'Wei Zhang', 3 ,4.5),
(4, 'Emily Brown', 4, 4.2),
(5, 'John Doe', 1,4.0),
(6, 'Liam Wilson', 5,4.3);
select *from persons;
-- Inner Join
SELECT Persons.Id AS Person_Id, Persons.Person_name, Country.Country_name
FROM Persons
INNER JOIN Country ON Persons.Country_id = Country.Id;
-- Left Join
SELECT Persons.Id AS Person_Id, Persons.Person_name, Country.Country_name
FROM Persons
LEFT JOIN Country ON Persons.Country_id = Country.Id;
-- Right Join
SELECT Persons.Id AS Person_Id, Persons.Person_name, Country.Country_name
FROM Persons
RIGHT JOIN Country ON Persons.Country_id = Country.Id;
 -- List all distinct country names from both the Country and Persons tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons
JOIN Country ON Persons.Country_id = Country.Id;
-- List all country names from both the Country and Persons tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons
JOIN Country ON Persons.Country_id = Country.Id;
-- Round the ratings of all persons to the nearest integer in the Persons table
SELECT Id AS Person_Id, Person_name, ROUND(Rating) AS Rounded_Rating
FROM Persons;

