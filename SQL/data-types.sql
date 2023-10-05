-- Boolean
-- True or False Values 
-- 1,yes,y,t,true
-- 0,no,f,false
CREATE TABLE book_availability(
	book_id INT NOT NULL PRIMARY KEY,
	availalbe BOOLEAN NOT NULL
)


INSERT INTO book_availability(book_id,availalbe)
VALUES(100,TRUE),(200,FALSE),(300,'t'),(400,'1'),(500,'y'),
(600,'yes'),(700,'no'),(800,'0');

SELECT * FROM book_availability WHERE availalbe='yes';

SELECT * FROM book_availability WHERE availalbe='0';
-- SAME AS --
SELECT * FROM book_availability WHERE NOT availalbe;


-- ####################################################################### --
-- Character
-- CHAR(n)
-- Stors fixed length stirng data of fixed lenth with padded space
CREATE TABLE char_test(
	id SERIAL PRIMARY KEY,
	x CHAR(1),
	y CHAR(10)
);

-- ERROR:  value too long for type character(1) 
-- SQL state: 22001
INSERT INTO char_test(x,y)
VALUES('Geeks','This is a test for char');

INSERT INTO char_test(x,y)
VALUES('G','This is a test for char This is a test for char');

-- This will work --
INSERT INTO char_test(x,y)
VALUES('G','Hello Geek');

SELECT * FROM char_test;


-- ####################################################################### --
-- VARCHAR(n)
-- Stroes varible length character string, no padding is added
CREATE TABLE varchar_test(
	id serial PRIMARY KEY,
	x VARCHAR (1),
	y VARCHAR (10)
);

-- ERROR:  value too long for type character varying(1) 
-- SQL state: 22001
INSERT INTO varchar_test(x,y)
VALUES(
	'Geeks',
	'This is a test for char'
);

-- Thiw Works --
INSERT INTO varchar_test(x,y)
VALUES(
	'G',
	'Hey Geeks'
);

SELECT * FROM varchar_test;

-- TEXT
--Stores unlimied length of string data

-- ####################################################################### --
-- NUMERIC
-- Integer
-- 1 Small Interger(SMALLINT) -32, 768 : 32, 767 , 2 - BYTE
-- 2 Integer(INT) -2,147,483,648 : 2,147,483,647, 4 - byte
-- 3 Serial(SERIAL) auto-generated in columns
-- Floating-Point Number
-- 1 float(n) : n precision floating numbers : 8 -bytes max
-- float8 / real : 4 bytes floating numbers
-- NUMERIC(d,p): d - number of digits, p - decimal places
CREATE TABLE IF NOT EXISTS products
(
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL,
	price NUMERIC (5,2)	
)

INSERT INTO products (name, price)
VALUES('Phone','100.2154'),('Tablet','300.2149');

-- 1	"Phone"	100.22
-- 2	"Tablet"	300.21
SELECT * FROM products;


-- Temporal
--  DATE,TIME,TIMESTAMP,TIMESTAMPZ,INTERVAL
CREATE TABLE employees(
	employee_id serial PRIMARY KEY,
	first_name VARCHAR(255),
	last_name VARCHAR(355),
	birth_date DATE NOT NULL,
	hire_date DATE NOT NULL
);

INSERT INTO employees(first_name,last_name,birth_date,hire_date)
VALUES
('Kevin','Jones','1996-12-03','2020-01-01'),
('Sophia','Nest','1997-08-24','2019-01-01'),
('Ashul','Karwal','1994-05-11','2017-01-01');

SELECT * FROM employees;

SELECT employee_id,first_name,last_name,AGE(birth_date), birth_date DOB
FROM employees;

-- UUID : Stores Universal Unique IDs based on RFC 4122, guarantee better 
-- uniqueness than serial, stoes sensitive data

-- Array : Stores arrays of string, integres etc

-- JSON : Supports JSON and JSONB(Binary)
CREATE TABLE orders(
	ID SERIAL NOT NULL PRIMARY KEY,
	info json NOT NULL
)

INSERT INTO orders(info)
VALUES
('{"customer": "Solo Shihundu", "items":{"Products":"coffee","qty": 6}}');

SELECT * FROM orders;


-- Stores JSON data parsed in query, fast quering but slow insertion due 
-- to indexing support
