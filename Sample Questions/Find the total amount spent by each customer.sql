-- Write a query to find the total amount spent by each customer

-- To ensure that customers with no orders have a total_amount of 0, 
-- the COALESCE function should be used.

SELECT c.customer_id, c.first_name, c.last_name, COALESCE(SUM(o.amount), 0) AS total_amount
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;