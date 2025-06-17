-- alter table customers add COLUMN bonjour varchar(255) default 'hi';
-- alter table customers rename column bonjour to greetings;

alter table customers
alter column greeting set not null,
alter column greeting type varchar(10);
update customers set greeting = case 
when country = 'France' then 'bonjour'
when country in ('Spain','Mexico') then 'hola'
-- else 'hi' (equiavalent)
else greeting
end;
-- alter table customers rename column greetings to greeting;
alter table customers alter greeting set default 'hi'; -- alter columns also work
-- alter table customers alter column greeting drop default; (alter without column also work)
select * from customers;
/*
create view "products above average price]" as
SELECT Product_Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);*/
-- ALTER VIEW "products above average price]" RENAME TO products_above_average_price;
CREATE OR REPLACE VIEW products_above_average_price AS
SELECT Product_Name, Price, product_id as "id"
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
select * from products_above_average_price;
-- alter table orders add unique (numbers, customer_id);
select * from orders;
-- ALTER TABLE random DROP CONSTRAINT random_pkey;
-- delete from random where id =3;
-- alter table random add primary key (r1, r2, r3);

/*
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key1;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key2;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key3;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key4;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key5;
ALTER TABLE orders DROP CONSTRAINT orders_numbers_customer_id_key6;
ALTER TABLE orders DROP CONSTRAINT uunique;
SELECT conname, contype
FROM pg_constraint
WHERE conrelid = 'orders'::regclass;*/
/*select * from random; 
alter table order_details
add constraint fk_order_details
foreign key (order_id) references orders(order_id);*/
select * from order_details;