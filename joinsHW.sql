SELECT CUSTOMERS.COMPANY_NAME,
	CUSTOMERS.CITY,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.CITY,
	SHIPPERS.COMPANY_NAME
FROM ORDERS
JOIN CUSTOMERS USING(CUSTOMER_ID)
JOIN EMPLOYEES USING(EMPLOYEE_ID)
JOIN SHIPPERS ON ORDERS.SHIP_VIA = SHIPPERS.SHIPPER_ID
WHERE SHIPPERS.COMPANY_NAME = 'Speedy Express'
GROUP BY CUSTOMERS.CUSTOMER_ID,
	EMPLOYEES.EMPLOYEE_ID,
	SHIPPERS.SHIPPER_ID
HAVING EMPLOYEES.CITY = 'London'
AND CUSTOMERS.CITY = 'London';


SELECT products.product_name,products.units_in_stock,
suppliers.contact_name, suppliers.phone,categories.category_name
FROM products
JOIN suppliers USING (supplier_id)
JOIN categories USING(category_id)
WHERE (categories.category_name = 'Beverages'  OR categories.category_name='Seafood')
AND products.units_in_stock < 20;

SELECT customers.contact_name, orders.order_id
FROM orders
LEFT JOIN customers USING(customer_id)
WHERE orders.order_id IS NULL;

SELECT customers.contact_name, orders.order_id
FROM customers
RIGHT JOIN orders USING(customer_id)
WHERE orders.order_id IS NULL;






