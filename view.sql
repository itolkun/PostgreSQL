CREATE VIEW OCE AS 
SELECT order_date, required_date, shipped_date,
ship_postal_code, company_name, contact_name, 
phone, last_name, first_name, title
FROM orders
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

SELECT * FROM OCE4
ORDER BY ship_country

DROP VIEW OCE3 
  
CREATE VIEW OCE2 AS
SELECT order_date, required_date, shipped_date, 
ship_postal_code, ship_country, company_name, 
contact_name, phone, last_name, first_name, title
FROM orders
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

CREATE OR REPLACE VIEW OCE4 AS 
SELECT order_date, required_date, shipped_date, 
ship_postal_code, ship_country, company_name, 
contact_name, phone, last_name, first_name, title,
customers.postal_code,
reports_to
FROM orders
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)


ALTER VIEW OCE2 RENAME TO OCE3
SELECT order_date, required_date, shipped_date, 
ship_postal_code, ship_country, company_name, 
contact_name, phone, last_name, first_name, title,ship_country,postal_code,
reports_to
FROM orders
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

CREATE VIEW products3 AS
SELECT *
FROM products
WHERE discontinued=0
WITH LOCAL CHECK OPTION;

SELECT * FROM products3


INSERT INTO products3 
VALUES (78,'abc',1,1,'abc',1,1,1,1,0)



