-- Having clause filter data by given conditions --
-- full dataset --
(]SELECT b.agent_code,b.agent_name,b.commission, SUM(a.payment_amt) total_amt
FROM customer a, agents b
WHERE a.agent_code = b.agent_code
GROUP BY b.agent_code,b.agent_name) c;

-- using having clause to limit date
-- to only agents with commission greater than 2000 --
SELECT agent_name, ROUND((total_amt * commission),2) commission
FROM
(SELECT b.agent_code,b.agent_name,b.commission, SUM(a.payment_amt) total_amt
FROM customer a, agents b
WHERE a.agent_code = b.agent_code
GROUP BY b.agent_code,b.agent_name
HAVING ROUND((SUM(a.payment_amt) * commission),2) > 2000
) c;