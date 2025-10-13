-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Amrithaa M
-- USN: 1RUA24BCA0010
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

-- 'root@localhost', 'RVU-PC-041', '8.4.6', '2025-09-01 11:25:46'

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
CREATE DATABASE LIBRARYDB;
USE LIBRARYDB;
CREATE TABLE BOOK(
BOOK_ID VARCHAR(50) PRIMARY KEY,
BOOK_TITLE VARCHAR(50),
AUTHOR VARCHAR(50),
PUBLISHED_YEAR INT,
AVAILABLE_COPIES INT);

CREATE TABLE MEMBER_TABLE(
MEMBER_ID VARCHAR(10) PRIMARY KEY,
MEMBER_NAME VARCHAR(20),
BOOK_ID VARCHAR(10),
FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID));



DESC BOOK;
DESC MEMBER_TABLE;



-- Paste the Output below for the given command ( DESC TableName;) 
-- 'BOOK_ID', 'varchar(50)', 'NO', 'PRI', NULL, ''
-- 'BOOK_TITLE', 'varchar(50)', 'YES', '', NULL, ''
-- 'AUTHOR', 'varchar(50)', 'YES', '', NULL, ''
-- 'PUBLISHED_YEAR', 'int', 'YES', '', NULL, ''
-- 'AVAILABLE_COPIES', 'int', 'YES', '', NULL, ''


-- 'MEMBER_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'MEMBER_NAME', 'varchar(20)', 'YES', '', NULL, ''
-- 'BOOK_ID', 'varchar(10)', 'YES', 'MUL', NULL, ''

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

INSERT INTO BOOK VALUES
("123A124","1984_THE BLACK SWAN","George Orwell",1949,4),
("124A124","HARRY POTTER1","JK_ROWLING", 2003,10),
("125A124","HARRY POTTER2","JK_ROWLING", 2004,10),
("126A124","HARRY POTTER3","JK_ROWLING", 2005,10),
("127A124","HARRY POTTER4","JK_ROWLING", 2006,10),
("128A124","HARRY POTTER5","JK_ROWLING", 2007,10);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


INSERT INTO MEMBER_TABLE VALUES
("A123", "ALICE", "125A124"),
("A124", "ALICE", "124A124"),
("A125", "ALICE", "126A124"),
("A126", "ALICE", "128A124");





-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

ALTER TABLE BOOK ADD COLUMN (UNITS_RECIEVED INT);
UPDATE BOOK SET UNITS_RECIEVED  = 20;





-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM BOOK;
SELECT * FROM MEMBER_TABLE;

-- '123A124', '1984_THE BLACK SWAN', 'George Orwell', '1949', '4', '20'
-- '124A124', 'HARRY POTTER1', 'JK_ROWLING', '2003', '10', '20'
-- '125A124', 'HARRY POTTER2', 'JK_ROWLING', '2004', '10', '20'
-- '126A124', 'HARRY POTTER3', 'JK_ROWLING', '2005', '10', '20'
-- '127A124', 'HARRY POTTER4', 'JK_ROWLING', '2006', '10', '20'
-- '128A124', 'HARRY POTTER5', 'JK_ROWLING', '2007', '10', '20'


-- 'A123', 'ALICE', '125A124'
-- 'A124', 'ALICE', '124A124'
-- 'A125', 'ALICE', '126A124'
-- 'A126', 'ALICE', '128A124'

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 
