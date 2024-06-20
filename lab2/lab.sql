-- references: https://www.sqlines.com/postgresql/how-to/create_user_defined_type
-- How to Create User-Defined Type (UDT)

-- Define a type using CREATE DOMAIN
CREATE DOMAIN addr VARCHAR(90) NOT NULL DEFAULT 'N/A';
-- Define a type using CREATE TYPE
CREATE TYPE address AS (city VARCHAR(90), street VARCHAR(90));
-- Use them in a table
CREATE TABLE location (ship_address addr, full_address address);

-- Create Scalar Type - Alias for Built-in Data Type

CREATE DOMAIN addr VARCHAR(90) NOT NULL DEFAULT 'N/A';
 
CREATE DOMAIN idx INT CHECK (VALUE > 100 AND VALUE < 999);

-- Create an Enumeration Type (Enum or Set of Values)
CREATE DOMAIN color VARCHAR(10)
CHECK (VALUE IN ('red', 'green', 'blue'));
CREATE TYPE color2 AS ENUM ('red', 'green', 'blue');

CREATE TABLE colors
(
  color color,       -- type created by CREATE DOMAIN
  color2 color2    -- type created by CREATE TYPE
);
 
 -- Let's insert the same data and test sorting
 INSERT INTO colors VALUES ('red', 'red');
 INSERT INTO colors VALUES ('blue', 'blue');

-- Sort by CREATE DOMAIN type (alphabetical order)
SELECT * FROM colors ORDER BY color;
 -- Result:
 -- blue   blue
 -- red    red
 
 -- Sort by CREATE TYPE type (by position)
SELECT * FROM colors ORDER BY color2;
 -- Result:
 -- red    red
 -- blue   blue
 
-- Composite Type
CREATE TYPE full_address AS
(
  city VARCHAR(90),
  street VARCHAR(90)
);


CREATE TABLE shipping
(
name VARCHAR(50),
address full_address
);
 
INSERT INTO shipping VALUES ('John', ('Northampton', 'Tower St'));
 -- or
INSERT INTO shipping VALUES ('Tom', ROW('Bracknell', 'Market St'));

SELECT address FROM shipping;

-- Select each field separately
SELECT (address).city, (address).street FROM shipping;