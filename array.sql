CREATE OR REPLACE FUNCTION filter_even(VARIADIC numbers int[]) RETURNS SETOF int AS $$
DECLARE 
counter int;
BEGIN
  -- FOR counter IN 1..array_upper(numbers,1)
   FOREACH counter IN ARRAY numbers
   LOOP
     CONTINUE WHEN counter % 2 != 0;
	 RETURN NEXT counter;
	 END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM filter_even(1,2,3,4,5,6,7,8);

CREATE OR REPLACE FUNCTION get_avg_freight(VARIADIC country text[]) RETURNS double precision AS $$ 
SELECT AVG(freight) 
FROM orders
WHERE ship_country= ANY(country) 
$$ LANGUAGE SQL


CREATE OR REPLACE FUNCTION filter_tel_num(oper int,VARIADIC tel_number text[]) RETURNS SETOF text AS $$
DECLARE cur_val text;
BEGIN
FOREACH cur_val IN ARRAY tel_number
LOOP RAISE NOTICE 'cur val is %',cur_val;
CONTINUE WHEN cur_val NOT LIKE CONCAT('__(', oper,')%');
RETURN NEXT cur_val;
END LOOP;
END;
$$ LANGUAGE plpgsql

SELECT * FROM filter_tel_num(903, VARIADIC ARRAY ['+7(983)1901235','+7(926)8561254','+7(903)1532476']);

SELECT get_avg_freight(VARIADIC ARRAY['USA','UK']);










