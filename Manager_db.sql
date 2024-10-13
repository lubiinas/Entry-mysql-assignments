#Create database
create database Manager;
use Manager;
#Create Managers Table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0 AND Age < 100),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
select*from Managers;
#Insert 10 Rows into the Managers Table
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-05-15', 44, 'Male', 'Sales', 30000),
(2, 'Aaliya', 'Khan', '1985-12-02', 38, 'Female', 'Marketing', 28000),
(3, 'Michael', 'Smith', '1979-07-21', 45, 'Male', 'IT', 35000),
(4, 'Sara', 'Johnson', '1992-03-14', 32, 'Female', 'HR', 25000),
(5, 'David', 'Williams', '1983-09-10', 41, 'Male', 'Finance', 40000),
(6, 'Maria', 'Rodriguez', '1987-01-26', 37, 'Female', 'IT', 27000),
(7, 'James', 'Brown', '1990-06-17', 34, 'Male', 'Operations', 32000),
(8, 'Emily', 'Davis', '1995-11-05', 29, 'Female', 'Sales', 22000),
(9, 'Chris', 'Taylor', '1988-02-08', 36, 'Male', 'IT', 33000),
(10, 'Emma', 'Wilson', '1993-04-25', 31, 'Female', 'Marketing', 30000);
#Query to Retrieve the Name and DOB of the Manager with Manager_Id = 1
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;
#Query to Display the Annual Income of All Managers
SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;
#Query to Display Records of All Managers Except ‘Aaliya’
SELECT *
FROM Managers
WHERE First_name <> 'Aaliya';
#Query to Display Details of Managers Whose Department is IT and Earns More Than 25000 per Month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;
#Query to Display Details of Managers Whose Salary is Between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;
