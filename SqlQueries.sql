-- Queries is not Case Sensetive

--  1. How to create a DataBase
CREATE DATABASE DBName;

--  2. To use Any DATABASE
USE DBName;

--  3. Create A TABLE     like Student Table Name

CREATE TABLE Student(
id INT PRIMARY KEY,
name VARCHAR(255)
);

-- 4. Insert VALUES

INSERT INTO Student VALUES(1,'sid');

--  5. Fetch DATA

SELECT * FROM Student;

--  varchar better than char both can contain 0-255 characters but varchar allocate size according to content size but char's 255 fixed size.

--  BLOB - Binary Large Object , Stores video Audio in binary format ,These type of bulky data
-- Truncate - Not delete table only delete row 

-- 6. Drop DATABASE , to delete a database
DROP DATABASE IF EXISTS DBName;

-- AUTOINCREMENT is a keyword in SQL which is used to increment value of a field automatically while inserting new records in a table.

-- Use select without From Clause , It refers dual table created by mysql
-- select 11+45;   56
--  select now();   2022-09-23 17:19:57 

--  select ucase('  vbfe ifbEfb');   VBFE IFBEFB 
--  select lcase(' hvb D ');      hvd d
-- space as it is at first and last and middle   

-- Where clause to reduce row and work on a condition 

