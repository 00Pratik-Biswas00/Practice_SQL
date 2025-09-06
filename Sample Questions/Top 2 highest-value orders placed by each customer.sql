-- write an SQL query to retrieve the top 2 highest-value orders placed by each 
-- customer based on the amount. If two orders have the same amount, both should be 
-- included with different number

WITH RankedOrders AS (
SELECT c.customer_id, o.order_id, o.item, o.amount,
ROW_NUMBER () OVER (PARTITION BY c.customer_id ORDER BY o.amount DESC) as row_num
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id)

SELECT customer_id, order_id, item, amount, row_num
FROM RankedOrders
WHERE row_num<=2;