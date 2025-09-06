select * from customers;
insert into customers values (3, "Alice", "Johnson", 40, "UK");
select * from orders;
delete from orders where order_id=103;

-- Write a query to find the customer who haven't place any orders

SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE order_id IS NULL;
