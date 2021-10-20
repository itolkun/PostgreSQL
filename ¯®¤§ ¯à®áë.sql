-- 1-е задание
SELECT product_id,AVG(quantity)
FROM order_details
GROUP BY product_id;

SELECT DISTINCT product_name,units_in_stock
FROM products
WHERE units_in_stock < ALL (SELECT AVG(quantity)
    FROM order_details
	GROUP BY product_id)
	ORDER BY units_in_stock DESC;

-- 2-е задание

SELECT customer_id, SUM(freight) as freight_sum
FROM orders
INNER JOIN (SELECT customer_id, AVG(freight) as freight_avg
			  FROM orders
			  GROUP BY customer_id)  oa
USING(customer_id)
WHERE freight>freight_avg AND shipped_date BETWEEN '1996-07-16' AND '1996-07-31'
GROUP BY customer_id
ORDER BY freight_sum;

--3-е задание
SELECT order_id,customer_id,ship_country, SUM(order_details.unit_price*order_details.quantity-order_details.unit_price*order_details.quantity*order_details.discount) as order_price
FROM orders
JOIN order_details USING(order_id)
WHERE  ship_country IN ('Brazil','Venezuela','Argentina') AND order_date >=  '1997-09-01'
GROUP BY order_id
ORDER BY order_price DESC
LIMIT 3;

SELECT customer_id,ship_country, order_price
FROM orders
JOIN (SELECT order_id,SUM(order_details.unit_price*order_details.quantity-order_details.unit_price*order_details.quantity*order_details.discount) as order_price
FROM order_details GROUP BY order_id)as od
USING(order_id)
WHERE ship_country IN ('Brazil','Venezuela','Argentina') AND order_date >=  '1997-09-01' 
ORDER BY order_price DESC
LIMIT 3;

--4-е задание
SELECT DISTINCT product_name,quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity = 10;

SELECT product_name
FROM products
WHERE product_id=ANY(SELECT product_id FROM order_details WHERE quantity=10);



