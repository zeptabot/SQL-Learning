SELECT * FROM cars
WHERE model not ilike 'P____';

SELECT * FROM cars
where year not between 1975 and 1977;

SELECT distinct * FROM cars
where brand is not null;

-- select * from cars;

SELECT MIN(contact_name)
FROM customers;

SELECT Max(price) as highest_price
FROM products ;

-- select * from products;