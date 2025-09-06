update customers
set country = "UK"
where customer_id = 3;

SELECT c.customer_id, c.first_name, c.last_name, 
SUM(o.amount) AS total_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY SUM(o.amount) DESC
LIMIT 2;


