BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

DROP TABLE IF EXISTS archive_poor_customers;

CREATE TABLE archive_poor_customers AS
SELECT customer_id,company_name, SUM(unit_price*quantity) AS total
FROM orders
JOIN order_details USING(order_id)
JOIN customers USING (customer_id)
GROUP BY company_name,customer_id
HAVING SUM(unit_price*quantity)<2000
ORDER BY SUM(unit_price*quantity) DESC

DELETE FROM order_details
WHERE order_id IN (SELECT order_id
				   FROM orders 
				   WHERE customer_id IN( SELECT customer_id FROM archive_poor_customers));
DELETE FROM orders
WHERE customer_id IN (SELECT customer_id FROM archive_poor_customers);

DELETE FROM customers
WHERE customer_id IN (SELECT customer_id FROM archive_poor_customers);

COMMIT;
ROLLBACK;
END;




BEGIN;

CREATE TABLE archive_products1 AS
SELECT product_id, product_name, discontinued
FROM products
WHERE discontinued = 1;

SAVEPOINT prod_dis1;

DELETE FROM order_details
WHERE product_id IN(SELECT product_id FROM archive_products);

DELETE FROM products
WHERE discontinued=1;

ROLLBACK TO prod_dis1;

COMMIT;

SELECT * FROM products


















