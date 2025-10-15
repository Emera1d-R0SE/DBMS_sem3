create database dbb;
use db;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

UPDATE Employee
SET salary = salary + 5000
WHERE designation = 'Developer';



SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Department d
LEFT JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;




INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Delhi'),
(4, 'Sales', 'Chennai');

INSERT INTO Employee (emp_id, emp_name, age, salary, designation, address, doj, dept_id) VALUES
(101, 'Ananya Rao', 28, 55000, 'HR Executive', 'Mumbai', '2020-03-15', 1),
(102, 'Ravi Kumar', 32, 70000, 'Developer', 'Bangalore', '2019-07-10', 2),
(103, 'Sneha Patel', 26, 48000, 'Developer', 'Bangalore', '2021-01-20', 2),
(104, 'Arjun Mehta', 35, 65000, 'Accountant', 'Delhi', '2018-09-25', 3),
(105, 'Priya Singh', 30, 42000, 'Sales Executive', 'Chennai', '2022-05-12', 4);



SELECT 
    UPPER(emp_name) AS emp_name_upper,
    UPPER(designation) AS designation_upper,
    CONCAT(emp_name, ' works as ', designation) AS description
FROM Employee;


SELECT 
    emp_name,
    YEAR(doj) AS joining_year,
    TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS years_worked
FROM Employee;



SELECT 
    emp_name, salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE salary BETWEEN 40000 AND 80000
  AND d.dept_name <> 'Sales';


SELECT 
    e.emp_name, e.designation, d.dept_name, d.location
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;
SELECT 
    e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d ON e.dept_id = d.dept_id;


SELECT 
    e.emp_name, d.dept_name
FROM Employee e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;

DELIMITER $$
CREATE PROCEDURE InsertEmployee (
    IN p_emp_id INT,
    IN p_emp_name VARCHAR(100),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(50),
    IN p_address VARCHAR(100),
    IN p_doj DATE,
    IN p_dept_id INT
)
BEGIN
    INSERT INTO Employee VALUES (p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id);
END $$
DELIMITER ;

-- Execute
CALL InsertEmployee(106, 'Rahul Sharma', 29, 60000, 'Developer', 'Pune', '2023-04-01', 2);
DELIMITER $$
CREATE PROCEDURE UpdateSalary (
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee SET salary = p_new_salary WHERE emp_id = p_emp_id;
END $$
DELIMITER ;

-- Execute
CALL UpdateSalary(104, 72000);
SELECT 
    e.emp_name,
    d.dept_name,
    TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS years_worked,
    (CASE 
        WHEN e.designation = 'Developer' THEN e.salary + 5000
        ELSE e.salary
     END) AS salary_after_increment
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2;
