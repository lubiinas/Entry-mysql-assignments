#create database
create database Country;
use Country;
-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
-- Insert into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (1, 'USA', 331000000, 9833520);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (2, 'Canada', 38000000, 9984670);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (3, 'UK', 67800000, 243610);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (4, 'Australia', 25600000, 7692024);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (5, 'India', 1380000000, 3287263);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (6, 'Germany', 83100000, 357022);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (7, 'France', 65200000, 551695);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (8, 'Italy', 60000000, 301340);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (9, 'Japan', 125000000, 377975);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES (10, 'Mexico', 126000000, 1964375);
select *from Country;
-- Insert into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (1, 'John', 'Doe', 500000, 4.6, 1, 'USA');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (2, 'Jane', 'Smith', 1000000, 3.8, 2, 'Canada');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (3, 'Michael', 'Brown', 750000, 4.2, 3, 'UK');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (4, 'Emily', 'White', 900000, 4.9, 4, 'Australia');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (5, 'Raj', 'Kumar', 1250000, 4.3, 5, 'India');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (6, 'Ahmed', 'Khan', 800000, 3.6, 6, 'Germany');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (7, 'Sarah', 'Johnson', 500000, 4.7, NULL, NULL);
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (8, 'Liu', 'Wei', 1200000, 4.5, 9, 'Japan');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (9, 'Carlos', 'Gomez', 1100000, 4.1, 10, 'Mexico');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES (10, 'Anna', 'Petrov', 1300000, 4.0, NULL, NULL);
select *from Persons;
#List the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;
#Select first names and last names from the Persons table with aliases
SELECT Fname AS FirstName, Lname AS LastName FROM Persons;
#Find all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;
#Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;
#Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
#Find all persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;
#Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
#Find all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
#Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
#Find all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';

