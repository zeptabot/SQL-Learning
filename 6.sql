alter table order_details alter column quantity drop not null;
alter table order_details alter column quantity set not null;
/*
ALTER TABLE order_details
ADD UNIQUE (quantity);*/
-- ALTER TABLE orders ADD numbers serial;
/*
ALTER TABLE orders
add constraint uunique unique (order_id, numbers);
*/
/* 
SELECT conname
FROM pg_constraint
WHERE conrelid = 'orders'::regclass AND contype = 'p';*/

-- Alter table orders drop constraint orders_pkey;
-- ALTER TABLE orders ADD PRIMARY KEY (order_id);

select * from orders;
ALTER TABLE orders
    ALTER COLUMN order_id type int,
    ALTER COLUMN customer_id type int,
    ALTER COLUMN numbers type int;
ALTER TABLE orders
    ALTER COLUMN order_id set not null,
    ALTER COLUMN customer_id set not null,
    ALTER COLUMN numbers set not null;
select * from orders;

-- ALTER TABLE Order_details ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
-- ALTER TABLE order_details DROP CONSTRAINT order_details_order_id_fkey;
-- ALTER TABLE order_details DROP CONSTRAINT order_details_order_id_fkey1;
-- ALTER TABLE order_details DROP CONSTRAINT order_details_order_id_fkey2;
-- ALTER TABLE order_details DROP CONSTRAINT order_details_order_id_fkey3;
-- ALTER TABLE order_details DROP CONSTRAINT order_details_order_id_fkey4;
/*
SELECT
    tc.constraint_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM
    information_schema.table_constraints AS tc
JOIN
    information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN
    information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE
    tc.constraint_type = 'FOREIGN KEY' 
    AND tc.table_name = 'order_details';
*/
/*
ALTER TABLE Order_details ADD constraint order_id_as_fkey
FOREIGN KEY (order_id) REFERENCES orders(order_id);*/
-- ALTER TABLE orders ADD constraint customer_id_as_fkey
-- FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- CREATE INDEX index_customers ON customers(customer_id, customer_name,contact_name);
-- DROP INDEX index_customers;
-- CREATE INDEX index_orders ON orders(customer_id, order_date, order_id);
SELECT 
    indexname,
    indexdef
FROM 
    pg_indexes
WHERE 
    tablename = 'orders';
/*
CREATE VIEW "German Customers" AS
select customer_id, customer_name, city from customers
where country = 'Germany'*/

select * from "German Customers";

-- ALTER TABLE customers ADD CONSTRAINT checker CHECK (customer_id >= 18);
-- an error because there ARE customer_id less than 18 LOL

CREATE TABLE test_bin (
    id SERIAL,
    bin_col BYTEA
);
INSERT INTO test_bin (bin_col) VALUES ('A'); 
select * from test_bin;
