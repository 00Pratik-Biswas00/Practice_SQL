-- write an SQL query to rank customers by age within each country. The oldest customer 
-- in each country should be ranked 1. If multiple customers have the same age, they should 
-- share the same rank, but the next rank(s) should be skipped accordingly (i.e., non-dense ranking)

select * from customers;
INSERT INTO Customers (customer_id, first_name, last_name, age, country) VALUES
(4, "Robert", "Luna", 22, "USA"),
(9, "Liam", "Jones", 30, "Canada");

SELECT c.customer_id, c.first_name, c.age, c.country,
RANK () OVER (PARTITION BY c.country ORDER BY c.age DESC) as age_rank
FROM Customers c;