-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: AMRITHAA M 
-- USN: 1RUA24BCA0010
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'Amrit', '8.4.6', '2025-08-25 11:24:37'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
CREATE DATABASE studentdb;
-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
USE studentdb;

CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50),
  HOD VARCHAR(50),
  ContactEmail VARCHAR(50),
  PhoneNumber VARCHAR(15),
  Location VARCHAR(50)
);

CREATE TABLE COURSE(
CourseID INT PRIMARY KEY,
 CourseName VARCHAR(10),
 Credits INT,
 DepartmentID INT,
 Duration INT,
 Fee INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));
 
CREATE TABLE STUDENT(
StudentID VARCHAR(10) PRIMARY KEY,
FirstName VARCHAR(10),
LastName VARCHAR(10),
Email VARCHAR(20),
DateOfBirth DATE,
CourseID INT,
FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID));

CREATE TABLE FACULTY(
FacultyID VARCHAR(10) PRIMARY KEY,
FacultyName VARCHAR(10),
DepartmentID INT,
Qualification VARCHAR(10),
Email VARCHAR(10),
PhoneNumber INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

CREATE TABLE ENROLLMENT(
EnrollmentID VARCHAR(10) PRIMARY KEY,
StudentID VARCHAR(10),
CourseID INT,
Semester INT,
Year INT,
Grade INT,
FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID));



DESC Departments;
DESC COURSE;
DESC STUDENT;
DESC FACULTY;
DESC ENROLLMENT;
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- 'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
-- 'DepartmentName', 'varchar(50)', 'YES', '', NULL, ''
-- 'HOD', 'varchar(50)', 'YES', '', NULL, ''
-- 'ContactEmail', 'varchar(50)', 'YES', '', NULL, ''
-- 'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''
-- 'Location', 'varchar(50)', 'YES', '', NULL, ''


-- 'CourseID', 'int', 'NO', 'PRI', NULL, ''
-- 'CourseName', 'varchar(10)', 'YES', '', NULL, ''
-- 'Credits', 'int', 'YES', '', NULL, ''
-- 'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'Fee', 'int', 'YES', '', NULL, ''

-- 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'FirstName', 'varchar(10)', 'YES', '', NULL, ''
-- 'LastName', 'varchar(10)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', '', NULL, ''
-- 'DateOfBirth', 'date', 'YES', '', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''

-- 'FacultyID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'FacultyName', 'varchar(10)', 'YES', '', NULL, ''
-- 'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
-- 'Qualification', 'varchar(10)', 'YES', '', NULL, ''
-- 'Email', 'varchar(10)', 'YES', '', NULL, ''
-- 'PhoneNumber', 'int', 'YES', '', NULL, ''

-- 'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'int', 'YES', '', NULL, ''


--  describe the structure of each table and copy paste the Output 

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table
ALTER TABLE Departments ADD DEAN VARCHAR(10), ADD NUM_OF_PROGRAMS INT;
ALTER TABLE COURSE ADD COURSE_FACULTY1 VARCHAR(10), ADD UNITS INT;
ALTER TABLE STUDENT ADD STUD_Address VARCHAR(100), ADD STUD_Gender CHAR(1);
ALTER TABLE FACULTY ADD FAC_JoiningDate DATE, ADD CABIN INT;
ALTER TABLE ENROLLMENT ADD CLASS_TEACHER VARCHAR(10), ADD COURSE_TYPE VARCHAR(10);


ALTER TABLE COURSE MODIFY Coursename VARCHAR(100);
ALTER TABLE Departments MODIFY location varchar(100);
ALTER TABLE STUDENT MODIFY STUD_Address VARCHAR(110);
ALTER TABLE FACULTY MODIFY FacultyName VARCHAR(100);
ALTER TABLE ENROLLMENT MODIFY CLASS_TEACHER VARCHAR(100);


ALTER TABLE COURSE MODIFY Coursename CHAR(100) ;
ALTER TABLE Departments MODIFY DepartmentName CHAR(50);
ALTER TABLE STUDENT MODIFY FirstName CHAR(10);
ALTER TABLE FACULTY MODIFY FacultyName CHAR(100);
ALTER TABLE ENROLLMENT MODIFY CLASS_TEACHER CHAR(100);

ALTER TABLE COURSE rename column Coursename to Course_title ;
ALTER TABLE Departments RENAME column location TO BUILDING;
ALTER TABLE STUDENT RENAME COLUMN FirstName TO NAME ;
ALTER TABLE FACULTY RENAME COLUMN PhoneNumber to contact;
ALTER TABLE ENROLLMENT rename column CLASS_TEACHER to prog_directer;

ALTER TABLE COURSE DROP COLUMN Credits;
ALTER TABLE Departments DROP column BUILDING;
ALTER TABLE STUDENT DROP COLUMN LastName;
ALTER TABLE FACULTY DROP COLUMN Email;
ALTER TABLE ENROLLMENT DROP column prog_directer;

rename TABLE COURSE to PROGRAM ;
RENAME TABLE Departments TO DEPT;
RENAME TABLE STUDENT TO STUDENT_TABLE;
RENAME TABLE FACULTY to FACULTY_TABLE;
RENAME TABLE ENROLLMENT to ADMISSION;


DESC DEPT;
DESC PROGRAM;
DESC STUDENT_TABLE;
DESC FACULTY_TABLE;
DESC ADMISSION;



-- 'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
-- 'DepartmentName', 'char(50)', 'YES', '', NULL, ''
-- 'HOD', 'varchar(50)', 'YES', '', NULL, ''
-- 'ContactEmail', 'varchar(50)', 'YES', '', NULL, ''
-- 'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''
-- 'DEAN', 'varchar(10)', 'YES', '', NULL, ''
-- 'NUM_OF_PROGRAMS', 'int', 'YES', '', NULL, ''

-- 'CourseID', 'int', 'NO', 'PRI', NULL, ''
-- 'Course_title', 'char(100)', 'YES', '', NULL, ''
-- 'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'Fee', 'int', 'YES', '', NULL, ''
-- 'COURSE_FACULTY', 'varchar(10)', 'YES', '', NULL, ''
-- 'NUMBER_OF_UNITS', 'int', 'YES', '', NULL, ''
-- 'COURSE_FACULTY1', 'varchar(10)', 'YES', '', NULL, ''
-- 'UNITS', 'int', 'YES', '', NULL, ''

-- 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'NAME', 'char(10)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', '', NULL, ''
-- 'DateOfBirth', 'date', 'YES', '', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- 'Address', 'varchar(100)', 'YES', '', NULL, ''
-- 'Gender', 'char(1)', 'YES', '', NULL, ''
-- 'STUD_Address', 'varchar(110)', 'YES', '', NULL, ''
-- 'STUD_Gender', 'char(1)', 'YES', '', NULL, ''


-- 'FacultyID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'FacultyName', 'char(100)', 'YES', '', NULL, ''
-- 'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
-- 'Qualification', 'varchar(10)', 'YES', '', NULL, ''
-- 'contact', 'int', 'YES', '', NULL, ''
-- 'JoiningDate', 'date', 'YES', '', NULL, ''
-- 'CABIN_NUMBER', 'varchar(10)', 'YES', '', NULL, ''
-- 'FAC_JoiningDate', 'date', 'YES', '', NULL, ''
-- 'CABIN', 'int', 'YES', '', NULL, ''

-- 'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'int', 'YES', '', NULL, ''
-- 'COURSE_TYPE', 'varchar(10)', 'YES', '', NULL, ''





/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
