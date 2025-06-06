-- 

SELECT contact_name, postal_code from customers 
where country = 'Canada'


-- ORDER BY customer_id;
-- order by postal_code asc;
order by postal_code desc;


SELECT * FROM customers
-- LIMIT 20 
offset 20;

SELECT COUNT(distinct country) FROM customers WHERE city = 'London';