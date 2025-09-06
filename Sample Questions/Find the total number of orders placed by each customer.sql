SELECT * FROM Customers;
SELECT * FROM Orders;

-- Write an SQL query to calculate the total number of orders placed by each customer. 

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
