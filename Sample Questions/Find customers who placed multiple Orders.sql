create database EPAM_TASKS;

-- 1

-- Given 2 tables, write an SQL query to find the customers 
-- (customer_id, first_name, and last_name) who have placed orders 
-- for more than one distinct item 

-- Customers Table
-- customer_id first_name last_name age country
-- 1 John Doe 25 USA
-- 2 Jane Smith 30 Canada

-- Orders Table
-- order_id item amount age customer_id
-- 101 Laptop 1000 25 1
-- 102 Mouse 50 25 1
-- 103 Keyboard 70 25 2

-- The query should return:
-- customer_id first_name last_name 1 John Doe

USE EPAM_TASKS;

CREATE TABLE Customers (
customer_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT NOT NULL,
country VARCHAR(50)
);

INSERT INTO Customers (customer_id, first_name, last_name, age, country) VALUES
(1, "John", "Doe", 25, "USA"),
(2, "Jane", "Smith", 30, "Canada");

CREATE TABLE Orders (
order_id INT NOT NULL PRIMARY KEY,
item VARCHAR(50),
amount INT NOT NULL,
age INT NOT NULL,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, item, amount, age, customer_id) VALUES
(101 ,"Laptop", 1000, 25, 1),
(102 ,"Mouse", 50, 25, 1),
(103 ,"Keyboard", 70, 25, 2);

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT customer_id, first_name, last_name
FROM Customers
WHERE customer_id IN (
					SELECT customer_id FROM Orders
					GROUP BY customer_id
					HAVING count(DISTINCT item) > 1
                    );
                    
-- Join approach

SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
JOIN Orders o 
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT o.item) > 1;
