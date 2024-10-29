create database func;
use func;
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
-- Add a new column DOB in the Persons table
ALTER TABLE Persons
ADD DOB DATE;
-- User-defined function to calculate age using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- SELECT query to fetch the age of all persons using the function 
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;
-- Find the length of each country name in the Country table
SELECT Id, Country_name, LENGTH(Country_name) AS NameLength
FROM Country;
-- Extract the first three characters of each country’s name in the Country table
SELECT Id, Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;
-- Convert all country names to uppercase and lowercase in the Country table
SELECT Id, Country_name, UPPER(Country_name) AS CountryNameUpper, LOWER(Country_name) AS CountryNameLower
FROM Country;


