/*
SELECT sum(customer_id)
FROM customers;

CREATE TABLE random (
    r1 NUMERIC(10, 2),
    r2 NUMERIC(10, 2),
    r3 NUMERIC(10, 2)
);

INSERT into random(r1, r2, r3) values(
(sELECT sum(order_id) as total_id FROM order_details),
(SELECT AVG(price) FROM products),
(SELECT AVG(customer_id)FROM customers)
 );
 */
/*
INSERT INTO random(r1, r2, r3)
VALUES(
  (SELECT AVG(order_id) FROM order_details),
  (SELECT SUM(price) FROM products),
  (SELECT MIN(customer_id) FROM customers));
 
 */
 
ALTER TABLE products 
ALTER COLUMN price 
TYPE numeric(10,2) 
USING price::numeric(10,2);
SELECT * FROM products;
SELECT * FROM customers
WHERE customer_name iLIKE '% b%';

SELECT 
  CASE 
    WHEN SUM(customer_id) FILTER (WHERE customer_id IN (SELECT customer_id FROM customers)) 
         = SUM(customer_id) FILTER (WHERE customer_id IS NOT NULL) 
    THEN 'true' 
    ELSE 'false' 
  END AS are_sums_equal
FROM customers;

SELECT * FROM customers
WHERE customer_id not IN (SELECT customer_id FROM orders);

/*
SELECT * FROM customers
WHERE customer_id IN (SELECT cars.customer_id FROM cars);
*/

SELECT * from customers
where customer_id between 22 and 57;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 15;

SELECT * from customers
where customer_name between 'A' and 'I' order by customer_name asc;

SELECT * FROM Products
WHERE product_name BETWEEN 'Milk' AND 'Tofu' order by PRODUCT_NAME;

select * from orders
where order_date between '2023-04-12' AND '2023-05-05';