create database sub;
use sub;
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
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Alax', 'mith', 3500, 4.1, 8, 'Canada');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(12, 'Jane', 'Smith', 7000, 3.8, 2, 'Canada');
select *from Persons;
-- Find the number of persons in each country
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;
-- Find the number of persons in each country, sorted from high to low
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;
-- Find out the average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;
-- Find the countries with the same rating as the USA (using subqueries)
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');
-- Select all countries whose population is greater than the average population of all nations
SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
-- Create the Product database and the Customer table
CREATE DATABASE Product;
USE Product;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Create Views for the Customer Table
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;
SELECT * FROM customer_info;
-- Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';
select*from US_Customers;
-- Create another view named Customer_details with columns full name (Combine first_name and last_name), email, phone_no, and state
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;
select *from Customer_details;
-- Update phone numbers of customers who live in California in the Customer_details view
UPDATE Customer
SET Phone_no = 'NewPhoneNumber'
WHERE State = 'California';
-- Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
-- Query that returns the number of customers in each state based on the "state" column in the "Customer_details" view
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;
-- Query that returns all the columns from the "Customer_details" view, sorted by the "state" column in ascending order
SELECT * FROM Customer_details
ORDER BY State ASC;











-- 
