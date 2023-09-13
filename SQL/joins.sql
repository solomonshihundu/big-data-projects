-- INNER JOIN --
SELECT 
a.id id_a,a.animal animal_a, b.id id_b, b.animal animal_b 
FROM zoo1 a
INNER JOIN zoo2 b
ON a.animal = b.animal;

-- LEFT JOIN --
SELECT
a.id,a.animal,b.id,b.animal
FROM zoo1 a
LEFT JOIN zoo2 b
ON a.animal = b.animal;

-- RIGHT JOIN --
SELECT
a.id,a.animal,b.id,b.animal
FROM zoo1 a
RIGHT JOIN zoo2 b
ON a.animal = b.animal;

-- FULL JOIN --
SELECT
a.id,a.animal,b.id,b.animal
FROM zoo1 a
FULL JOIN zoo2 b
ON a.animal = b.animal;

-- SELF JOIN --
SELECT 
a.id,a.animal,b.id,b.aniaml
FROM zoo1 a
INNER JOIN zoo1 b
ON JOIN_PREDICATE;

-- SELF JOIN --
SELECT 
a.username ||' '||a.last_name username,
b.first_name ||' '||b.last_name fullname
FROM user_details a
INNER JOIN user_details b
ON a.username = b.username;