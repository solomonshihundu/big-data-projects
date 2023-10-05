-- CREATE DOMAIN --
-- creates a user-defined data type that can have optional constraints 
-- CREATE TYPE --
--  creates a composite type(data type- that are mixes of two
--  or more data types) using stored procedures


-- Code sample without use of domains --
CREATE TABLE marksheet(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    marks INT NOT NULL,
    -- Checks that first and last names dont
    -- contain any spaces
    CHECK(
        first_name !~ '\s' AND last_name !~ '\s'
    )
);

-- Using Domains --
-- Lets create the domain with above condition --
CREATE DOMAIN student_details AS
    VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE marksheet(
    student_id SERIAL NOT NULL PRIMARY KEY,
    first_name student_details,
    last_name student_details,
    marks INT NOT NULL,
    email VARCHAR NOT NULL
);

-- TEST WITH VALUE WITH SPACES --
-- ERROR:  value for domain student_details violates check constraint "student_details_check" 

-- SQL state: 23514
INSERT INTO marksheet (first_name,last_name,marks,email)
VALUES('Solo mon','Shihundu',98,'ss@gmail.com');

-- WORKING CODE --
INSERT INTO marksheet (first_name,last_name,marks,email)
VALUES('Solomon','Shihundu',98,'ss@gmail.com');