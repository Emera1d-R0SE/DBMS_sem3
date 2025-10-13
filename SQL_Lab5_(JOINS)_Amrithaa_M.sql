-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Amrithaa M

-- USN: 1RUA24BCA0010
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- # USER(), Host_Name, MySQL_Version, Current_Date_Time
-- 'root@localhost', 'Amrit', '8.4.6', '2025-09-22 11:26:59'

-- Write your code below this line along with the output 
create database db;
use db;

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50))
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Esha', 'Bangalore'),
(2, 'Amrithaa', 'Mangalore'),
(3, 'Ananya', 'Bangalore'),
(4, 'Prateeksha', 'Mysore'),
(5, 'Deepti', 'Mysore');







-- insert 5 records

-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(101, 1, 'Laptop', '2025-09-01'),
(102, 2, 'Phone', '2025-09-05'),
(103, 1, 'Mouse', '2025-09-10'),
(104, 3, 'Tablet', '2025-09-15'),
(105, 2, 'Keyboard', '2025-09-20');

-- TASK FOR STUDENTS 
-- Write and Execute Queries



/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/

SELECT c.customer_name, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';

-- # customer_name, product_name
-- 'Esha', 'Laptop'
-- 'Esha', 'Mouse'
-- 'Ananya', 'Tablet'

SELECT c.customer_name, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
-- # customer_name, product_name
-- 'Esha', 'Laptop'
-- 'Esha', 'Mouse'
-- 'Amrithaa', 'Phone'
-- 'Amrithaa', 'Keyboard'
-- 'Ananya', 'Tablet'


SELECT c.customer_name, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
-- # customer_name, order_date
-- 'Esha', '2025-09-01'
-- 'Esha', '2025-09-10'
-- 'Amrithaa', '2025-09-05'
-- 'Amrithaa', '2025-09-20'
-- 'Ananya', '2025-09-15'


SELECT o.order_id, c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
-- # order_id, customer_name
-- '101', 'Esha'
-- '103', 'Esha'
-- '102', 'Amrithaa'
-- '105', 'Amrithaa'
-- '104', 'Ananya'


SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
-- # customer_name, total_orders
-- 'Esha', '2'
-- 'Amrithaa', '2'
-- 'Ananya', '1']



SELECT c.city, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- # city, product_name
-- 'Bangalore', 'Laptop'
-- 'Bangalore', 'Mouse'
-- 'Mangalore', 'Phone'
-- 'Mangalore', 'Keyboard'
-- 'Bangalore', 'Tablet'





/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates.
-- Write your code below this line along with the output 
*/
 

SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- # customer_name, product_name
-- 'Esha', 'Laptop'
-- 'Esha', 'Mouse'
-- 'Amrithaa', 'Phone'
-- 'Amrithaa', 'Keyboard'
-- 'Ananya', 'Tablet'
-- 'Prateeksha', NULL
-- 'Deepti', NULL


SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- # customer_id, customer_name, order_id
-- '1', 'Esha', '101'
-- '1', 'Esha', '103'
-- '2', 'Amrithaa', '102'
-- '2', 'Amrithaa', '105'
-- '3', 'Ananya', '104'
-- '4', 'Prateeksha', NULL
-- '5', 'Deepti', NULL


SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
-- # customer_name, total_orders
-- 'Esha', '2'
-- 'Amrithaa', '2'
-- 'Ananya', '1'
-- 'Prateeksha', '0'
-- 'Deepti', '0'


SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- # customer_name
-- 'Prateeksha'
-- 'Deepti'


SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- # customer_name, order_date
-- 'Esha', '2025-09-01'
-- 'Esha', '2025-09-10'
-- 'Amrithaa', '2025-09-05'
-- 'Amrithaa', '2025-09-20'
-- 'Ananya', '2025-09-15'
-- 'Prateeksha', NULL
-- 'Deepti', NULL


 SELECT Customers.customer_name, Orders.order_date
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
-- # customer_name, order_date
-- 'Esha', '2025-09-01'
-- 'Esha', '2025-09-10'
-- 'Amrithaa', '2025-09-05'
-- 'Amrithaa', '2025-09-20'
-- 'Ananya', '2025-09-15'
-- 'Prateeksha', NULL
-- 'Deepti', NULL

 
 
 
/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */


-- All orders and their customers
SELECT o.order_id, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # order_id, customer_name
-- '101', 'Esha'
-- '103', 'Esha'
-- '102', 'Amrithaa'
-- '105', 'Amrithaa'
-- '104', 'Ananya'
-- NULL, 'Prateeksha'
-- NULL, 'Deepti'

-- Product names with customers
SELECT o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # product_name, customer_name
-- 'Laptop', 'Esha'
-- 'Mouse', 'Esha'
-- 'Phone', 'Amrithaa'
-- 'Keyboard', 'Amrithaa'
-- 'Tablet', 'Ananya'
-- NULL, 'Prateeksha'
-- NULL, 'Deepti'




-- Order IDs with customer cities
SELECT o.order_id, c.city
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # order_id, city
-- '101', 'Bangalore'
-- '103', 'Bangalore'
-- '102', 'Mangalore'
-- '105', 'Mangalore'
-- '104', 'Bangalore'
-- NULL, 'Mysore'
-- NULL, 'Mysore'

-- Number of orders per customer (including those without orders)
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;
-- # customer_name, total_orders
-- 'Esha', '2'
-- 'Amrithaa', '2'
-- 'Ananya', '1'
-- 'Prateeksha', '0'
-- 'Deepti', '0'

-- Customers without matching orders
SELECT c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;
-- # customer_name
-- 'Prateeksha'
-- 'Deepti'




/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  
  

SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # customer_name, product_name
-- 'Esha', 'Mouse'
-- 'Esha', 'Laptop'
-- 'Amrithaa', 'Keyboard'
-- 'Amrithaa', 'Phone'
-- 'Ananya', 'Tablet'
-- 'Prateeksha', NULL
-- 'Deepti', NULL


SELECT c.customer_id, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # customer_id, order_id
-- '1', '101'
-- '1', '103'
-- '2', '102'
-- '2', '105'
-- '3', '104'
-- '4', NULL
-- '5', NULL


SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # customer_name, order_date
-- 'Esha', '2025-09-10'
-- 'Esha', '2025-09-01'
-- 'Amrithaa', '2025-09-20'
-- 'Amrithaa', '2025-09-05'
-- 'Ananya', '2025-09-15'
-- 'Prateeksha', NULL
-- 'Deepti', NULL


SELECT c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_name, o.order_id
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- # customer_name, order_id
-- 'Prateeksha', NULL
-- 'Deepti', NULL


SELECT c.city, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.city, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- # city, product_name
-- 'Bangalore', 'Mouse'
-- 'Bangalore', 'Laptop'
-- 'Mangalore', 'Keyboard'
-- 'Mangalore', 'Phone'
-- 'Bangalore', 'Tablet'
-- 'Mysore', NULL

  
  
  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output 
  */

SELECT * FROM Customers NATURAL JOIN Orders;

-- # customer_id, customer_name, city, order_id, product_name, order_date
-- '1', 'Esha', 'Bangalore', '101', 'Laptop', '2025-09-01'
-- '2', 'Amrithaa', 'Mangalore', '102', 'Phone', '2025-09-05'
-- '1', 'Esha', 'Bangalore', '103', 'Mouse', '2025-09-10'
-- '3', 'Ananya', 'Bangalore', '104', 'Tablet', '2025-09-15'
-- '2', 'Amrithaa', 'Mangalore', '105', 'Keyboard', '2025-09-20'




SELECT customer_name, product_name
FROM Customers NATURAL JOIN Orders;

-- # customer_name, product_name
-- 'Esha', 'Laptop'
-- 'Amrithaa', 'Phone'
-- 'Esha', 'Mouse'
-- 'Ananya', 'Tablet'
-- 'Amrithaa', 'Keyboard'



SELECT customer_name, order_date
FROM Customers NATURAL JOIN Orders;

-- # customer_name, order_date
-- 'Esha', '2025-09-01'
-- 'Amrithaa', '2025-09-05'
-- 'Esha', '2025-09-10'
-- 'Ananya', '2025-09-15'
-- 'Amrithaa', '2025-09-20'



SELECT city, product_name
FROM Customers NATURAL JOIN Orders;

-- # city, product_name
-- 'Bangalore', 'Laptop'
-- 'Mangalore', 'Phone'
-- 'Bangalore', 'Mouse'
-- 'Bangalore', 'Tablet'
-- 'Mangalore', 'Keyboard'




  -- END OF THE EXPERIMENT