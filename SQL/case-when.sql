CREATE OR REPLACE FUNCTION get_price_segment(p_file_id integer)
RETURNS VARCHAR(100) AS 
$$
DECLARE
 	rate NUMERIC;
	price_segment VARCHAR(100);
BEGIN
	SELECT INTO rate rental_rate
	FROM film
	WHERE file_id = p_file_id;
	
	CASE rate
	WHEN 0.99 THEN
		price_segment = 'Mass';
	WHEN 2.99 THEN
		price_segment = 'Mainstream';
	WHEN 4.99 THEN
		price_segemnt = 'High End';
	ELSE
		price_segment = 'Unspecified';
	END CASE;
	
	RETURN price_segment;
END; 
$$
LANGUAGE plpgsql;

SELECT get_price_segment(123) AS "Price Segment";