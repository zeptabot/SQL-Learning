SELECT customer_id as IDs
FROM customers;

/*SELECT customer_name namesssssss
FROM customers;*/

select products.product_name, categories.category_name from categories
inner join products on products.category_id = categories.category_id
order by category_name;

SELECT categories.category_id, categories.category_name, products.product_name
FROM categories
LEFT JOIN products ON products.category_id = categories.category_id
ORDER BY categories.category_id;

select products.product_name, categories.category_name from categories
full join products on products.category_id = categories.category_id
ORDER BY categories.category_id;

SELECT testproduct_id, product_name, category_name
FROM testproducts
inner JOIN categories ON testproducts.category_id = categories.category_id;

SELECT testproduct_id, product_name, category_name
FROM testproducts
right JOIN categories ON testproducts.category_id = categories.category_id;

SELECT testproduct_id, product_name, category_name
FROM testproducts
full JOIN categories ON testproducts.category_id = categories.category_id;

SELECT testproduct_id, product_name, category_name
FROM testproducts
CROSS JOIN categories;

SELECT testproduct_id, product_name, category_name
FROM testproducts
CROSS JOIN categories;


SELECT testproducts.category_id,categories.category_id
FROM testproducts
CROSS JOIN categories;

SELECT product_name, category_name
FROM categories
CROSS JOIN testproducts;

SELECT product_id, product_name
FROM products
UNION
SELECT testproduct_id, product_name
FROM testproducts
ORDER BY product_id;

SELECT category_id, testproduct_id
FROM testproducts
UNION
SELECT category_id, product_id
FROM products
ORDER BY  category_id;

SELECT category_id, product_id
FROM products
UNION
SELECT category_id, testproduct_id
FROM testproducts;

SELECT COUNT(customer_id)
FROM customers
Group by country;

SELECT COUNT(customer_id), country -- either country or None. Any other column results in ERROR
FROM customers
Group by country;

SELECT customers.customer_name, orders.order_id
FROM orders
right JOIN customers ON orders.customer_id = customers.customer_id;

SELECT count(customers.customer_name), orders.order_id
FROM orders
right JOIN customers ON orders.customer_id = customers.customer_id
group by orders.order_id;

SELECT customers.customer_name, count(orders.order_id)
FROM orders
right JOIN customers ON orders.customer_id = customers.customer_id
group by customer_name order by count;

SELECT customers.customer_name, avg(orders.order_id)
FROM orders
right JOIN customers ON orders.customer_id = customers.customer_id
group by customer_name order by avg;

SELECT min(customers.customer_name), orders.order_id
FROM orders
right JOIN customers ON orders.customer_id = customers.customer_id
group by orders.order_id;

SELECT COUNT(customer_id), country
FROM customers
GROUP BY country
having COUNT(customer_id) > 5;

select order_date, customer_name from orders
left join customers on customers.Customer_id = orders.customer_id
where order_date > '2023-01-01'; -- ALL ORDERS MADE IN 2023!

select order_id, 
SUM(products.price*quantity) as "total order cost" from order_details
left join products on order_details.product_id = products.product_id
group by order_id
HAVING SUM(products.price*quantity) > 3000.00
order by order_id;

SELECT order_id
  FROM orders inner join customers
  on orders.customer_id = customers.customer_id;

SELECT customers.customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id
  FROM orders inner join customers
  on orders.customer_id = customers.customer_id;
);



