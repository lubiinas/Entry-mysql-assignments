-- create database
create database sort;
use sort;
-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

-- Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833517),
(3, 'Brazil', 213000000, 8515767),
(4, 'China', 1440000000, 9596961),
(5, 'Russia', 146000000, 17098242),
(6, 'Japan', 125000000, 377975),
(7, 'Germany', 83000000, 357022),
(8, 'Canada', 38000000, 9984670),
(9, 'Australia', 25600000, 7692024),
(10, 'France', 67000000, 551695);
select*from Country;

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'India'),
(2, 'Jane', 'Smith', 7000, 3.8, 2, 'USA'),
(3, 'Carlos', 'Santos', 9000, 4.2, 3, 'Brazil'),
(4, 'Li', 'Wang', 8000, 4.0, 4, 'China'),
(5, 'Olga', 'Ivanova', 6000, 3.9, 5, 'Russia'),
(6, 'Yuki', 'Tanaka', 4500, 4.7, 6, 'Japan'),
(7, 'Hans', 'Muller', 5000, 4.3, 7, 'Germany'),
(8, 'Alex', 'Smith', 3500, 4.1, 8, 'Canada'),
(9, 'Steve', 'Brown', 4000, 3.6, 9, 'Australia'),
(10, 'Pierre', 'Dubois', 5500, 3.7, 10, 'France');
select *from Persons;
-- Print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;
-- Concatenate Fname and Lname from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS FullName
FROM Persons;
-- Count the number of unique Country_name from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries
FROM Persons;
-- Print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population
FROM Country;
-- Print the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;
-- Insert 2 new rows into Persons with Lname as NULL, then count Lname
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11, 'Ali', NULL, 3000, 3.5, 1, 'India'),
       (12, 'Sara', NULL, 3200, 3.9, 2, 'USA');
       select*from Persons;
SELECT COUNT(Lname) AS Non_Null_Lname_Count
FROM Persons;
-- Find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;
-- Show the population of the Country table for the first 3 rows
SELECT Population
FROM Country
LIMIT 3;
-- Print 3 random rows of countries
SELECT * FROM Country
ORDER BY RAND()
LIMIT 3;
-- List all persons ordered by their rating in descending order
SELECT * FROM Persons
ORDER BY Rating DESC;
-- Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;
-- Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;
-- List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;
