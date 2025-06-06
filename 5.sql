SELECT SUM(customer_id), country
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5;

SELECT COUNT(customer_id), country
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5;

SELECT order_details.order_id, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY order_id
HAVING SUM(products.price) > 400.00;

SELECT order_details.product_id, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY order_details.product_id;

SELECT order_details.order_id, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY order_id;

SELECT order_details.order_id, 
products.price*order_details.quantity as total_price
FROM order_details
LEFT JOIN products
ON order_details.product_id = products.product_id;

SELECT order_details.order_id, 
sum(products.price*order_details.quantity) as total_price
FROM order_details
LEFT JOIN products
ON order_details.product_id = products.product_id
group by order_id
having sum(products.price*order_details.quantity) > 400;

SELECT customers.customer_name, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN orders ON order_details.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name
HAVING SUM(products.price) > 1000.00;

SELECT customers.customer_name, products.price
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN orders ON order_details.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

SELECT customers.customer_name, products.price*order_details.quantity
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN orders ON order_details.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

SELECT customers.customer_name, sum(products.price*quantity) as total_cost
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN orders ON order_details.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
group by customer_name;

SELECT customers.customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id
  FROM orders
  WHERE customer_id = customers.customer_id
);

SELECT orders.order_id
 FROM orders left join customers
on orders.customer_id = customers.customer_id;

select distinct customers.customer_name
from customers right join orders
on orders.customer_id = customers.customer_id
order by customer_name;

SELECT customers.customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id
  FROM orders
  WHERE customer_id = customers.customer_id
);

SELECT distinct customers.customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id
  FROM orders
  WHERE customer_id = customers.customer_id
) order by customer_name; -- "DISTINCT" shuffles order, "ORDER BY" resorts. REDUNDANT.

SELECT customers.customer_name
FROM customers
WHERE NOT EXISTS (
  SELECT *
  FROM orders
  WHERE customer_id = customers.customer_id
);

select distinct customer_name from customers
right join orders
on orders.customer_id <> customers.customer_id;

select product_name from products
where products.product_id = ANY (
select order_details.product_id from order_details
where quantity > 120);

SELECT product_id
  FROM order_details
  WHERE quantity > 10;

SELECT product_name
FROM products
WHERE product_id = any (
  SELECT product_id
  FROM order_details
  WHERE quantity > 10
);


SELECT product_name
FROM products
WHERE product_id = ALL (
  SELECT product_id
  FROM order_details
  WHERE quantity > 10
);

SELECT product_name
FROM products
WHERE product_id > ALL (
  SELECT product_id
  FROM order_details
  WHERE quantity > 10
);

SELECT product_name,
CASE
  WHEN price < 10 THEN 'Low price product'
  WHEN price > 50 THEN 'High price product'
ELSE
  'Normal product'
END
FROM products;

SELECT product_name,
CASE
  WHEN price < 10 THEN 'low'
  WHEN price > 50 THEN 'high'
ELSE
  'normal'
END
FROM products;

SELECT Order_id ,
CASE
  WHEN quantity < 10 THEN 'small amount'
  WHEN quantity >= 10 THEN 'large amount'
end
from order_details;

SELECT order_details.order_id, 
sum(products.price*order_details.quantity) as total_price,
CASE
  WHEN sum(products.price*order_details.quantity) < 400 THEN 'small order'
  WHEN sum(products.price*order_details.quantity) >= 1000 THEN 'large order'
else 
  'medium order'
end
FROM order_details
LEFT JOIN products
ON order_details.product_id = products.product_id
group by order_id;