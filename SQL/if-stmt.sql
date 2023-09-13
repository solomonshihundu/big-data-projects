-- IF STATEMENT --
DO $$
DECLARE

a integer := 10;
b integer := 20;

BEGIN
	IF a > b 
	THEN
	RAISE NOTICE 'a is greater than b';
	END IF;
	
	IF a < b 
	THEN
	RAISE NOTICE 'a is less than b';
	END IF;
	
	IF a = b 
	THEN
	RAISE NOTICE 'a is equal to b';
	END IF;
END $$;

-- IF ELSE STATEMENT --
DO $$
DECLARE
a integer := 100;
b integer := 40;

BEGIN
	IF a > b THEN
		RAISE NOTICE 'a greater than b';
	ELSIF a < b THEN
		RAISE NOTICE 'a less than b';
	ELSE
		RAISE NOTICE 'a equal to b';
	END IF;
END $$;