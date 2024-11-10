create database sp;
use sp;
#Stored Procedure to Add a New Record
DELIMITER $$
CREATE PROCEDURE Worker(
    IN p_worker_id INT,
    IN p_firstname CHAR(25),
    IN p_lastname CHAR(25),
    IN p_salary INT(15),
    IN p_joiningdate DATETIME,
    IN p_department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_worker_id, p_firstname, p_lastname, p_salary, p_joiningdate, p_department);
END $$
DELIMITER ;
select *from worker;
#Procedure Call
CALL Worker(2,'Jane', 'Smith', 60000, '2022-03-15', 'Finance');
#Stored Procedure to Retrieve Salary of a Worker
DELIMITER //
CREATE PROCEDURE GetWorkerSalary (
    IN p_worker_id INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary INTO p_salary
    FROM Worker
    WHERE Worker_Id = p_worker_id;
END //
DELIMITER ;
#Procedure Call
SET @salary = 0;
CALL GetWorkerSalary(11, @salary);
SELECT @salary AS WorkerSalary;
#Stored Procedure to Update Department of a Worker
DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment (
    IN p_worker_id INT,
    IN p_department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_department
    WHERE Worker_Id = p_worker_id;
END //
DELIMITER ;
#Procedure Call
CALL UpdateWorkerDepartment(11, 'Finance');
#Stored Procedure to Count Workers in a Department
DELIMITER //
CREATE PROCEDURE CountWorkersInDepartment (
    IN p_department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_department;
END //
DELIMITER ;
#Procedure Call
SET @workerCount = 0;
CALL CountWorkersInDepartment('Finance', @workerCount);
SELECT @workerCount AS WorkerCount;
#Stored Procedure to Calculate Average Salary in a Department
DELIMITER //
CREATE PROCEDURE AvgSalaryInDepartment (
    IN p_department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_department;
END //
DELIMITER ;
#Procedure Call
SET @avgSalary = 0;
CALL AvgSalaryInDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;






