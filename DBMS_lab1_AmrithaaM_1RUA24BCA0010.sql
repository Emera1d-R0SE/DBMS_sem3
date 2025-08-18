-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: AMRITHAA M
-- USN: RUA24BCA0010
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'Amrit', '8.4.6', '2025-08-18 11:32:56'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
create database DBLab001;
use DBLab001;
-- Write your SQL query below Codespace:

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth
create table Students
(
StudentID varchar(10) Primary Key,
First_name varchar(10),
Last_name varchar(10),
Email varchar(20) UNIQUE,
DoB date
);

-- Write your SQL query below Codespace:

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'First_name', 'varchar(10)', 'YES', '', NULL, ''
-- 'Last_name', 'varchar(10)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
-- 'DoB', 'date', 'YES', '', NULL, ''


-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table
alter table Students add (gender varchar(2), age int);
alter table Students modify First_name varchar(20);
alter table Students rename column Email to email_address;
alter table Students Drop column Last_name;
Rename table Students to Student_table;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses(
courseID varchar(10) primary key,
coursename varchar(10),
credits varchar(2));
DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :

-- 'courseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'coursename', 'varchar(10)', 'YES', '', NULL, ''
-- 'credits', 'varchar(2)', 'YES', '', NULL, ''

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table courses add (Course_teacher varchar(2), course_time int(2));
alter table courses modify credits int(2);
alter table courses rename column coursename to course_title;
alter table courses Drop column course_time;
Rename table courses to course_details;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table ENROLLMENT(
EnrollmentID varchar(10) primary key,
StudentID varchar(10),
CourseID varchar(10),
EnrollmentDate date,
foreign key (StudentID) References Student_table(StudentID),
foreign key (CourseID) References course_details(courseID));
DESC ENROLLMENT; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

-- 'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
-- 'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
-- 'EnrollmentDate', 'date', 'YES', '', NULL, ''

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table ENROLLMENT add (EMAIL varchar(20), phone int(10));
alter table ENROLLMENT modify EnrollmentID varchar(20);
alter table ENROLLMENT rename column EnrollmentID to Entrollment_number;
alter table ENROLLMENT Drop column phone;
Rename table ENROLLMENT to Enrollment_detail;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table Student_table add (Phonenumber int(10));
DESC Student_table; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'First_name', 'varchar(20)', 'YES', '', NULL, ''
-- 'email_address', 'varchar(20)', 'YES', 'UNI', NULL, ''
-- 'DoB', 'date', 'YES', '', NULL, ''
-- 'gender', 'varchar(2)', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

alter table course_details modify credits decimal(3,2);
-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table course_details;
drop table ENROLLMENT;
SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01