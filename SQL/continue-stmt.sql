DO
$$
DECLARE
cnt int := 0;
BEGIN
    LOOP
    -- increment of cnt
    cnt = cnt + 1;

    -- exit loop if cnt is greater than 10
    EXIT WHEN cnt > 10;

    -- skip iteration if we encounter odd number
    CONTINUE WHEN MOD(cnt,2) = 1;

    -- print out the cnt
    RAISE NOTICE '%', cnt;

    END LOOP;
END;
$$;


DO
$$
DECLARE
cnt int := 0;
BEGIN
    LOOP
    -- increment of cnt
    cnt = cnt + 1;

    -- exit loop if cnt is greater than 10
    EXIT WHEN cnt > 10;

    -- skip iteration if we encounter odd number
    CONTINUE WHEN cnt = 6;

    -- print out the cnt
    RAISE NOTICE '%', cnt;
    
    END LOOP;
END;
$$;