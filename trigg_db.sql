create database trrg;
use trrg;
#Create the teachers table and insert 8 rows
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Math', 5, 50000),
(2, 'Bob', 'Science', 8, 60000),
(3, 'Charlie', 'English', 3, 45000),
(4, 'Diana', 'History', 10, 55000),
(5, 'Eve', 'Physics', 12, 65000),
(6, 'Frank', 'Chemistry', 7, 48000),
(7, 'Grace', 'Biology', 15, 70000),
(8, 'Hank', 'Geography', 2, 42000);

#before_insert_teacher		: Ensures salary is non-negative before allowing an insert operation.
#after_insert_teacher		: Logs each insert operation in the teacher_log table with the teacher ID, action, and timestamp.
#before_delete_teacher		: Prevents deletion of rows for teachers with more than 10 years of experience.
#after_delete_teacher		: Logs each delete operation in the teacher_log table with details of the deleted teacher.  '''

#Create before_insert_teacher trigger to validate salary.
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;
#Create the teacher_log table and after_insert_teacher trigger.
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END$$

DELIMITER ;
#Create before_delete_teacher trigger to validate experience
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with more than 10 years of experience';
    END IF;
END$$

DELIMITER ;
#Create after_delete_teacher trigger to log deletions.
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$

DELIMITER ;

