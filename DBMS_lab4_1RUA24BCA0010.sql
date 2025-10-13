-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: AMRITHAA M
-- USN: 1RUA24BCA0010
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
-- # USER(), Host_Name, MySQL_Version, Current_Date_Time
-- 'root@localhost', 'Amrit', '8.4.6', '2025-09-15 11:33:38'
CREATE DATABASE EMPL;
USE EMPL;
CREATE TABLE Employees (  
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(100),  
    Age INT,  
    Salary DECIMAL(10,2),  
    DepartmentID INT,  
    HireDate DATE,  
    Address VARCHAR(255)  
);  

INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 

/* 
Exercise 1: Arithmetic Operators
Addition, Subtraction, Multiplication, Division
Q1 - Add a bonus (10% of Salary) to each employee’s salary.

Q2 - Subtract tax (15% of Salary) from each employee’s salary.

Q3 - Calculate the yearly salary from the monthly salary.

-- Modulus Operator
Q4 - Find the remainder when employees’ ages are divided by 5.*/

-- Write your code below this line along with the output 
SELECT (Salary + Salary*0.10) AS New_Salary FROM Employees;
--   # New_Salary
-- '550000.00'
-- '605000.00'
-- '638000.00'
-- '660000.00'
-- '704000.00'
-- '770000.00'
-- '825000.00'
-- '935000.00'
-- '990000.00'
-- '1078000.00'

SELECT (SALARY - (SALARY*0.15)) AS TAX FROM Employees;
  
--   
--   # TAX
-- '42500.0000'
-- '46750.0000'
-- '49300.0000'
-- '51000.0000'
-- '54400.0000'
-- '59500.0000'
-- '63750.0000'
-- '72250.0000'
-- '76500.0000'
-- '83300.0000'


SELECT (SALARY*12) AS ANNUAL FROM EMPLOYEES;

-- # ANNUAL
-- '720000.00'
-- '660000.00'
-- '900000.00'
-- '1080000.00'
-- '600000.00'
-- '840000.00'
-- '696000.00'
-- '1176000.00'
-- '768000.00'
-- '1020000.00'

SELECT (AGE%5) FROM EMPLOYEES;
-- # (AGE%5)
-- '0'
-- '3'
-- '0'
-- '0'
-- '2'
-- '2'
-- '4'
-- '0'
-- '1'
-- '3'

/* Exercise 2: Logical Operators: AND, OR, NOT

Q5 - Retrieve employees older than 30 AND with salary > 50000.

Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.

Q7 - Retrieve employees NOT living in City G.*/

-- Write your code below this line along with the output 
SELECT * FROM EMPLOYEES WHERE AGE>30 AND SALARY>50000;
 

--  # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
-- '4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
-- '6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
-- '8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
-- '9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
-- '10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'


SELECT * FROM EMPLOYEES WHERE DEPARTMENTID=1 OR SALARY>70000;
-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
-- '3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
-- '4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
-- '7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
-- '8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
-- '10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'

SELECT * FROM EMPLOYEES WHERE Address not like '404 Walnut St, City G';
-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
-- '2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
-- '3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
-- '4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
-- '5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
-- '6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
-- '8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
-- '9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
-- '10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'

/* Exercise 3: Comparison Operators

Q8 - Equality, Inequality, Greater Than, Less Than

Q9 - Find employees with salary = 60000.

Q10 - List employees not in the IT department (no IT department exists; returns all).

Q11 - Retrieve employees younger than 25 with salary > 50000 

Q12 - List employees aged 25–35.

Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).

Q14 - Find employees with names starting with A.

Q15 - List employees with no address.

*/

-- Write your code below this line along with the output 

SELECT *FROM EMPLOYEES WHERE SALARY=60000;

-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'

SELECT *FROM EMPLOYEES WHERE DepartmentID>6;
-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address

SELECT * FROM EMPLOYEES WHERE AGE<25 AND salary > 50000;


SELECT * FROM EMPLOYEES WHERE AGE BETWEEN 25 AND 35;

SELECT *
FROM Employees
WHERE DepartmentID IN (1, 2, 3);

-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
-- '2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
-- '3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
-- '4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
-- '7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
-- '8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'



SELECT *
FROM Employees
WHERE Name LIKE 'A';

SELECT *
FROM Employees
WHERE Address IS NULL;

-- # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
-- '1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
-- '2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
-- '3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
-- '5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
-- '6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
-- '7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
-- '9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'



/* 

Exercise 5: Set Operators: UNION.

Q16 - Retrieve names from the HR department hired in 2022 OR 2023.

Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.

Q18 - Find employees hired in 2023 but not in 2022.

*/

SELECT *FROM EMPLOYEES WHERE HireDate = 2022-09-30 OR 2023-02-14;