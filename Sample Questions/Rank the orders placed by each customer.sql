-- write an SQL query to rank the orders placed by each customer based on the amount. 
-- The highest amount should get rank 1. If two or more orders have the same amount, 
-- they should share the same rank.

update orders
set amount = 1000
where amount = 70;

SELECT 
    c.customer_id, 
    o.order_id, 
    o.item, 
    o.amount,
    RANK() OVER (PARTITION BY c.customer_id ORDER BY o.amount DESC) AS rank_no
FROM Customers c
JOIN Orders o
  ON c.customer_id = o.customer_id
ORDER BY c.customer_id, rank_no;