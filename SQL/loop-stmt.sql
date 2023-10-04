DO 
$$
DECLARE
	n integer := 6;
	cnt integer := 1;
BEGIN
	LOOP
	EXIT WHEN cnt = n;
	RAISE NOTICE '%', cnt;
	cnt := cnt + 1;
	END LOOP;
END;
$$;


DO
$$
DECLARE
add integer := 0;
BEGIN
WHILE add < 10 
LOOP
RAISE NOTICE  'Out addition count %', add;
add := add + 1;
END LOOP;
END
$$;