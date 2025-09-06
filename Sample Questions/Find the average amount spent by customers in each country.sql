select * from customers;
insert into orders (order_id, item, amount, age, customer_id) values 
(103, "Keyboard", 70, 30, 2),
(104, "Monitor", 200, 40, 3);

set SQL_SAFE_UPDATES = 0;

update customers
set country = "Canada"
where country = "UK";

-- Write a Query find the average amount spent by customers in each country

select country, AVG(amount)
from customers c
join orders o
on c.customer_id = o.customer_id
group by country;
