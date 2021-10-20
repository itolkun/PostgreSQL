-- 1)
CREATE OR REPLACE FUNCTION backup_customers() RETURNS void AS $$
DROP TABLE IF EXISTS backedup_customers;
CREATE TABLE backedup_customers AS
SELECT * FROM customers;
$$ LANGUAGE SQL;

SELECT * FROM backup_customers();
SELECT count(*) FROM customers;

--2)
CREATE OR REPLACE FUNCTION avg_freight() RETURNS double precision AS $$
SELECT AVG(freight) FROM orders
$$ LANGUAGE SQL;

SELECT * FROM avg_freight();



--3)
CREATE OR REPLACE FUNCTION RAND_(bottom int, top int) RETURNS int AS $$

BEGIN
  
  RETURN FLOOR(random()*((top-bottom)+1)+bottom);
 END;

$$ LANGUAGE plpgsql;

SELECT RAND_(1,3) FROM generate_series(1,5);


--4)
CREATE OR REPLACE FUNCTION get_salary_by_city(emp_city varchar, OUT low numeric, OUT high numeric) AS $$
SELECT MIN(salary), MAX(salary)
FROM employees
WHERE city=emp_city;
$$ LANGUAGE SQL;

SELECT get_salary_by_city('London');

CREATE OR REPLACE FUNCTION salary_kor(  bottom numeric  , top numeric DEFAULT 70) RETURNS SETOF employees AS $$
DECLARE salaryy record;
BEGIN
FOR salaryy IN SELECT * FROM employees
LOOP
IF salaryy.salary = bottom THEN 
salaryy.salary=salaryy.salary*1.5;
ELSE salaryy.salary=salaryy.salary;
END IF;
RETURN NEXT salaryy
END LOOP;
END;
$$ LANGUAGE plpgsql;


ALTER TABLE employees 
ADD COLUMN salary numeric;

INSERT INTO employees (salary)
VALUES(28)

select * from employees










