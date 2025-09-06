-- write an SQL query to identify the top 2 oldest customers in each country. 
-- If multiple customers have the same age, 
-- they should share the same rank. Use DENSE_RANK() to handle ties.
select * from customers;

with AgeRanks as(
select customer_id, first_name, age, country,
dense_rank() over(partition by country order by age desc) as age_rank
from customers)
select customer_id, first_name, age, country, age_rank
from AgeRanks
where age_rank<=2;
