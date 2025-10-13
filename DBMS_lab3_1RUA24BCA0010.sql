-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: AMRITHAA M
-- USN: 1RUA24BCA0010
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost', 'Amrit', '8.4.6', '2025-09-08 11:30:23'


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

-- 2. Insert 10 records to employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

-- 4. Insert 10 records to Orders
Create DATABASE EMP;
USE EMP;
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary Int,
    BirthDate DATE,
    HireDate DATE
);

INSERT INTO Employee values
(010, 'Esheshwari', "K", 100000, '1111-12-12','2025-12-12'), 
(011,'Amrithaa',' M', 9900000, '2006-10-19', '2025-12-12'),
(012, 'Ananya', 'R', 75000, '2006-01-24', '2024-01-01'), 
(013, 'Prateeksha', 'S',1000000, '2006-07-07', '2006-07-07'),
(014, 'Deepti', 'S',1000000, '2006-07-07', '2006-07-07'),
(015, 'Sridevi', 'S',100000, '2006-07-07', '2006-07-07'),
(016, 'Ishigami', 'Senku',100000, '2006-07-07', '2006-07-07'),
(017, 'Krish', 'Patil',100000, '2006-07-07', '2006-07-07'),
(018, 'Prateek', 'S',1000000, '2006-07-07', '2006-08-07'),
(019, 'Prati', 'S',100000, '2006-07-07', '2006-09-07');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);
INSERT INTO Orders VALUES
(1001, '2025-01-10', 15000.00, 010),
(1002, '2025-01-15', 22000.50, 011),
(1003, '2025-02-01', 17500.75, 012),
(1004, '2025-02-10', 9800.00, 013),
(1005, '2025-03-05', 12000.00, 014),
(1006, '2025-03-15', 21000.00, 015),
(1007, '2025-04-01', 19999.99, 016),
(1008, '2025-04-10', 25000.00, 017),
(1009, '2025-05-01', 30000.00, 018),
(1010, '2025-05-15', 18000.00, 019);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
 SELECT * FROM Employee;




-- Output: 

-- '10', 'Esheshwari', 'K', '100000.00', '1111-12-12', '2025-12-12'
-- '11', 'Amrithaa', ' M', '9900000.00', '2006-10-19', '2025-12-12'
-- '12', 'Ananya', 'R', '75000.00', '2006-01-24', '2024-01-01'
-- '13', 'Prateeksha', 'S', '1000000.00', '2006-07-07', '2006-07-07'
-- '14', 'Deepti', 'S', '1000000.00', '2006-07-07', '2006-07-07'
-- '15', 'Sridevi', 'S', '100000.00', '2006-07-07', '2006-07-07'
-- '16', 'Ishigami', 'Senku', '100000.00', '2006-07-07', '2006-07-07'
-- '17', 'Krish', 'Patil', '100000.00', '2006-07-07', '2006-07-07'
-- '18', 'Prateek', 'S', '1000000.00', '2006-07-07', '2006-08-07'
-- '19', 'Prati', 'S', '100000.00', '2006-07-07', '2006-09-07'



 SELECT * FROM orders;
 
-- '1001', '2025-01-10', '15000.00', '10'
-- '1002', '2025-01-15', '22000.50', '11'
-- '1003', '2025-02-01', '17500.75', '12'
-- '1004', '2025-02-10', '9800.00', '13'
-- '1005', '2025-03-05', '12000.00', '14'
-- '1006', '2025-03-15', '21000.00', '15'
-- '1007', '2025-04-01', '19999.99', '16'
-- '1008', '2025-04-10', '25000.00', '17'
-- '1009', '2025-05-01', '30000.00', '18'
-- '1010', '2025-05-15', '18000.00', '19'

				

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select round(Salary) as roundsalary from employee;


-- Output: 

-- '100000'
-- '9900000'
-- '75000'
-- '1000000'
-- '1000000'
-- '100000'
-- '100000'
-- '100000'
-- '1000000'
-- '100000'

/* b. Absolute Values: Show absolute values of salaries */
Select abs(Salary) as rbssalary from employee;
-- Output: 
-- '100000.00'
-- '9900000.00'
-- '75000.00'
-- '1000000.00'
-- '1000000.00'
-- '100000.00'
-- '100000.00'
-- '100000.00'
-- '1000000.00'
-- '100000.00'

/* c. Ceiling Values: Get ceiling values of order amounts */
Select ceil(Salary) as ceilsalary from employee;
-- Output: 
-- '100000'
-- '9900000'
-- '75000'
-- '1000000'
-- '1000000'
-- '100000'
-- '100000'
-- '100000'
-- '1000000'
-- '100000'

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select count(*) as totalemployee from employee;

-- Output: 
-- '10'

/* b. Sum of Salaries: Calculate total salary expense */
Select sum(Salary) as totalsalary from employee;
-- Output: 

-- '13475000.00'

/* c. Average Order Amount: Find average order value */
Select avg(Salary) as totalsalary from employee;
-- Output: 
-- '1347500.000000'

/* d. Max/Min Salary: Find highest and lowest salaries */
Select MIN(Salary) as totalsalary from employee;
/* d. Max/Min Salary: Find highest and lowest salaries */
Select max(Salary) as totalsalary from employee;
-- Output: 
-- 	totalsalary
-- 	75000.00

-- '9900000.00'

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
Select FirstName, LastName, upper(firstname) as upperfirstname, lower(lastname) as lowerlastname from Employee;

-- Output: 
-- 'Esheshwari', 'K', 'ESHESHWARI', 'k'
-- 'Amrithaa', ' M', 'AMRITHAA', ' m'
-- 'Ananya', 'R', 'ANANYA', 'r'
-- 'Prateeksha', 'S', 'PRATEEKSHA', 's'
-- 'Deepti', 'S', 'DEEPTI', 's'
-- 'Sridevi', 'S', 'SRIDEVI', 's'
-- 'Ishigami', 'Senku', 'ISHIGAMI', 'senku'
-- 'Krish', 'Patil', 'KRISH', 'patil'
-- 'Prateek', 'S', 'PRATEEK', 's'
-- 'Prati', 'S', 'PRATI', 's'

/* b. Concatenate Names: Create full names */
select concat(FirstName, LastName) from employee;
-- Output: 
-- 'EsheshwariK'
-- 'Amrithaa M'
-- 'AnanyaR'
-- 'PrateekshaS'
-- 'DeeptiS'
-- 'SrideviS'
-- 'IshigamiSenku'
-- 'KrishPatil'
-- 'PrateekS'
-- 'PratiS'

/* c. Extract Substring: Get first 3 characters of first names */
select substr(FirstName,1,4) from Employee;
-- Output: 
-- 'Eshe'
-- 'Amri'
-- 'Anan'
-- 'Prat'
-- 'Deep'
-- 'Srid'
-- 'Ishi'
-- 'Kris'
-- 'Prat'
-- 'Prat'

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert date to text: Convert text to DATE type */
SELECt cast(OrderDate as char) as convertdate from orders;
-- Output: 
-- '2025-01-10'
-- '2025-01-15'
-- '2025-02-01'
-- '2025-02-10'
-- '2025-03-05'
-- '2025-03-15'
-- '2025-04-01'
-- '2025-04-10'
-- '2025-05-01'
-- '2025-05-15'

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select now();
-- Output: 
-- '2025-09-08 12:51:52'

/* b. Extract Year: Get year from order dates */
select extract(year from OrderDate) as OrderYear from orders;
-- Output: 
-- # OrderYear
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'
-- '2025'

/* c. Add Months: Add 3 months to order dates */
select date_add(OrderDate, interval 3 month) as FinalDate from orders;
-- Output: 
-- '2025-04-10'
-- '2025-04-15'
-- '2025-05-01'
-- '2025-05-10'
-- '2025-06-05'
-- '2025-06-15'
-- '2025-07-01'
-- '2025-07-10'
-- '2025-08-01'
-- '2025-08-15'

/* d. Days Since Order: Calculate days between order date and now */
select OrderId, Datediff(Orderdate, Now())as dayssinceorder from orders;
-- Output: 
-- '1001', '-241'
-- '1002', '-236'
-- '1003', '-219'
-- '1004', '-210'
-- '1005', '-187'
-- '1006', '-177'
-- '1007', '-160'
-- '1008', '-151'
-- '1009', '-130'
-- '1010', '-116'

-- END of the Task -- 