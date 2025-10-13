-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Amrithaa M
-- USN: 1RUA24BCA0010
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 	USER()	Host_Name	MySQL_Version	Current_Date_Time
-- 	root@localhost	Amrit	8.4.6	2025-10-13 11:23:31


-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:

CREATE DATABASE DBLab008;
USE DBLab008;

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:


CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(30),
    address VARCHAR(100),
    date_of_join DATE
);

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
DESC EMPLOYEE;

-- # Field, Type, Null, Key, Default, Extra
-- 'empid', 'int', 'NO', 'PRI', NULL, ''
-- 'empname', 'varchar(50)', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''
-- 'salary', 'decimal(10,2)', 'YES', '', NULL, ''
-- 'designation', 'varchar(30)', 'YES', '', NULL, ''
-- 'address', 'varchar(100)', 'YES', '', NULL, ''
-- 'date_of_join', 'date', 'YES', '', NULL, ''

-- insert 10 records to the table 
-- Write your SQL query below Codespace:

INSERT INTO EMPLOYEE VALUES(101, 'AMRIT', 21, '100000.00', 'SDE-1', 'BANGALORE', '2025-10-19'),
(102, 'AMRITAA', 21, '100000.00', 'SDE-1', 'BANGALORE', '2025-10-19'),
(103, 'AMRI', 21, '130000.00', 'SDE-1', 'MANGALORE', '2025-10-19'),
(104, 'AMAR', 23, '104000.00', 'SDE-1', 'MYSORE', '2025-10-19'),
(105, 'ANIL', 24, '107000.00', 'SDE-1', 'BANGALORE', '2025-10-19'),
(106, 'SUNIL', 31, '100000.00', 'SDE-1', 'MANGALORE', '2025-10-19'),
(107, 'ESHA', 26, '103000.00', 'SDE-1', 'BANGALORE', '2025-10-19'),
(108, 'MISHA', 27, '102000.00', 'SDE-1', 'BANGALORE', '2025-10-19'),
(109, 'PRISHA', 21, '100000.00', 'SDE-1', 'MYSORE', '2025-10-19'),
(110, 'MEENA', 23, '109900.00', 'SDE-1', 'MYSORE', '2025-10-19');

SELECT * FROM EMPLOYEE;
-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;


-- # empid, empname, age, salary, designation, address, date_of_join
-- '101', 'AMRIT', '21', '100000.00', 'SDE-1', 'BANGALORE', '2025-10-19'
-- '102', 'AMRITAA', '21', '100000.00', 'SDE-1', 'BANGALORE', '2025-10-19'
-- '103', 'AMRI', '21', '130000.00', 'SDE-1', 'MANGALORE', '2025-10-19'
-- '104', 'AMAR', '23', '104000.00', 'SDE-1', 'MYSORE', '2025-10-19'
-- '105', 'ANIL', '24', '107000.00', 'SDE-1', 'BANGALORE', '2025-10-19'
-- '106', 'SUNIL', '31', '100000.00', 'SDE-1', 'MANGALORE', '2025-10-19'
-- '107', 'ESHA', '26', '103000.00', 'SDE-1', 'BANGALORE', '2025-10-19'
-- '108', 'MISHA', '27', '102000.00', 'SDE-1', 'BANGALORE', '2025-10-19'
-- '109', 'PRISHA', '21', '100000.00', 'SDE-1', 'MYSORE', '2025-10-19'
-- '110', 'MEENA', '23', '109900.00', 'SDE-1', 'MYSORE', '2025-10-19'




-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER $$
CREATE PROCEDURE InsEmployee (
IN P_EMPID INT,
IN P_empname VARCHAR(50),
IN P_age INT,
IN P_salary DECIMAL(10,2),
IN P_designation VARCHAR(30),
IN P_address VARCHAR(100),
IN P_date_of_join DATE
)
BEGIN 
	INSERT INTO EMPLOYEE VALUES ( EMPID, EMPNAME, AGE, SALARY, DESIGNATION, ADDRESS, DATE_OF_JOIN);
END $$

DELIMITER ;

CALL INSEMPLOYEE(111, 'RONALD', 27, 10000.00, 'SDE-2', 'VELLORE, TN', '2025-10-01'); 



DELIMITER $$
CREATE PROCEDURE InsertEmployeeWithAgeCheck (
    IN P_EMPID INT,
    IN P_empname VARCHAR(50),
    IN P_age INT,
    IN P_salary DECIMAL(10,2),
    IN P_designation VARCHAR(30),
    IN P_address VARCHAR(100),
    IN P_date_of_join DATE
)
BEGIN
    IF P_age BETWEEN 18 AND 60 THEN
        INSERT INTO Employee VALUES (P_EMPID, P_empname, P_age, P_salary, P_designation, P_address, P_date_of_join);
    ELSE
        SELECT 'Invalid age, employee not added.' AS Message;
    END IF;
END $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE InsertEmployeeDefaultSalary (
    IN P_EMPID INT,
    IN P_empname VARCHAR(50),
    IN P_age INT,
    IN P_salary DECIMAL(10,2),
    IN P_designation VARCHAR(30),
    IN P_address VARCHAR(100),
    IN P_date_of_join DATE
)
BEGIN
    IF P_salary IS NULL THEN
        SET P_salary = 20000.00;
    END IF;
    INSERT INTO Employee VALUES (P_EMPID, P_empname, P_age, P_salary, P_designation, P_address, P_date_of_join);
END $$
DELIMITER ;




DELIMITER $$
CREATE PROCEDURE InsertThreeEmployees ()
BEGIN
    INSERT INTO Employee VALUES (112, 'RAHUL', 28, 25000.00, 'SDE-2', 'CHENNAI', '2025-10-01');
    INSERT INTO Employee VALUES (113, 'PRIYA', 30, 30000.00, 'SDE-2', 'HYDERABAD', '2025-10-01');
    INSERT INTO Employee VALUES (114, 'KARAN', 26, 27000.00, 'SDE-2', 'PUNE', '2025-10-01');
END $$
DELIMITER ;

-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.

Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.

Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.

Update Address:
Write a procedure to update the address of an employee when empid is given as input.

Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."

*/



DELIMITER $$
CREATE PROCEDURE UpdateSalary (
    IN P_EMPID INT,
    IN P_NewSalary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee SET salary = P_NewSalary WHERE empid = P_EMPID;
END $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE IncrementManagerSalary ()
BEGIN
    UPDATE Employee SET salary = salary * 1.10 WHERE designation = 'Manager';
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE UpdateDesignation (
    IN P_EMPID INT,
    IN P_NewDesignation VARCHAR(30)
)
BEGIN
    UPDATE Employee SET designation = P_NewDesignation WHERE empid = P_EMPID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE UpdateAddress (
    IN P_EMPID INT,
    IN P_NewAddress VARCHAR(100)
)
BEGIN
    UPDATE Employee SET address = P_NewAddress WHERE empid = P_EMPID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE ConditionalSalaryUpdate (
    IN P_EMPID INT,
    IN P_NewSalary DECIMAL(10,2)
)
BEGIN
    DECLARE empAge INT;
    SELECT age INTO empAge FROM Employee WHERE empid = P_EMPID;
    
    IF empAge > 40 THEN
        UPDATE Employee SET salary = P_NewSalary WHERE empid = P_EMPID;
    ELSE
        SELECT 'Not eligible for salary update.' AS Message;
    END IF;
END $$
DELIMITER ;

-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.

Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').

Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.

Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/


DELIMITER $$
CREATE PROCEDURE DeleteEmployee (
    IN P_EMPID INT
)
BEGIN
    DELETE FROM Employee WHERE empid = P_EMPID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteByDesignation (
    IN P_Designation VARCHAR(30)
)
BEGIN
    DELETE FROM Employee WHERE designation = P_Designation;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteLowSalaryEmployees ()
BEGIN
    DELETE FROM Employee WHERE salary < 15000.00;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE DeleteOldJoiners ()
BEGIN
    DELETE FROM Employee WHERE YEAR(date_of_join) < 2015;
END $$
DELIMITER ;

-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01