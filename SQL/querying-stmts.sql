-- FETCH --
-- Gets the first 10 rows in table --
SELECT username,gender 
FROM user_details
ORDER BY user_id
FETCH FIRST 10 ROW ONLY;

-- Offsets the fetch query by 5 rows, thus fetch 
-- the next ten rows after the fifth row
SELECT username,gender 
FROM user_details
ORDER BY user_id
OFFSET 5 ROWS
FETCH FIRST 10 ROW ONLY;

-- WHERE CLAUSE --
SELECT username,gender
FROM user_details
WHERE user_id > 30;

-- WHERE, IN CLAUSE --
SELECT user_Id,username,gender
FROM user_details
WHERE user_id IN (10,20)
ORDER BY user_id;

SELECT first_name,last_name
FROM user_details
WHERE user_id IN 
(SELECT user_id FROM user_details WHERE MOD(user_id,2) = 1);

-- Returns number of orders each agent succeeded with --
SELECT b.agent_name, a.agent_code, COUNT(a.ord_num) 
FROM orders a,agents b
WHERE a.agent_code = b.agent_code
GROUP BY a.agent_code,b.agent_name;

-- Get the total commision each agent has from the total sales --
-- 1) To Get commission, agents.commission * sum(customer.payment_amt) --
-- 2) Total cusomer payments associated with an agent -- sum(customer.payment_amt) by agent_code
SELECT agent_name, total_amt * commission commission 
FROM
(SELECT b.agent_code,b.agent_name,b.commission, SUM(a.payment_amt) total_amt
FROM customer a, agents b
WHERE a.agent_code = b.agent_code
GROUP BY b.agent_code,b.agent_name) c;

-- character matching query with LIKE --
-- its a case sensitive operation --
-- all records with the second last char as 'a' --
SELECT * FROM CUSTOMER
WHERE cust_name
LIKE '%a_';


-- all records with the second char as 'A' NOTE : only in caps--
SELECT * FROM CUSTOMER
WHERE cust_name
LIKE '_A%';

-- all records with an 'a' anywhere in the string 
SELECT * FROM CUSTOMER
WHERE cust_name
LIKE '%a%';

-- BETWEEN CLAUSE --
SELECT agent_name, total_amt * commission AS commission 
FROM
(SELECT b.agent_code,b.agent_name,b.commission, SUM(a.payment_amt) total_amt
FROM customer a, agents b
WHERE a.agent_code = b.agent_code
GROUP BY b.agent_code,b.agent_name) c
WHERE total_amt 
BETWEEN 10000 AND 20000;
