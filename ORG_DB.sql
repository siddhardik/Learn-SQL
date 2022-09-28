CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);


-- How To insert more row at one time 
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

-- For Knowing About All Attribute         
SELECT * FROM Worker;

--  For knowing About one Specific Attribute 
select salary from worker;
-- For more than one 
select salary ,first_name from worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');


 -- Where clause to reduce row and work on a condition 
 SELECT * FROM worker where salary>100000;
 SELECT * FROM worker where Department='hr';

 select * from worker where salary between 80000 AND 100000;
 // 80000 and 100000  both are inclusive!

 SELECT * FROM worker where Department='hr' or Department ='admin' or department ='Account' ;

--  Better Way  using in keyword
SELECT * FROM worker where Department IN('hr','admin');

SELECT * FROM worker where Department NOT IN('hr','admin');

INSERT INTO Title  VALUES
 (001, NULL, '2016-02-20 00:00:00');

 SELECT * from Title where worker_title is NULL;

Select * from org.worker;

--  Wild Card
SELECT * FROM worker where first_name like '%i%';
SELECT * FROM worker where first_name like '_i%';

--  Select Data Sorting
-- using ORDER BY, By default increasing order  ASC
SELECT * FROM worker order by salary; 

-- using ORDER BY, By default decreasing order
SELECT * FROM worker order by salary DESC; 

select department from worker;
-- DISTINCT 
select distinct department from worker;

-- Without Using Aggregation group by behaves like DISTINCT
select  department from worker group by department;
--Using Aggregation  , First data rearrangement    Below Five Types Aggregation
select  department,COUNT(*) from worker group by department;

select  department,COUNT(department) from worker group by department;
-- Above two are same but column name diff

select  department,AVG(salary) from worker group by department;
-- MIN AND MAX of each department
select  department,MIN(salary) from worker group by department;  
select  department,MAX(salary) from worker group by department;  

--Total salary of each department
select  department,SUM(salary) from worker group by department; 

-- Department, Count having more than two employee

-- Group by Having
select  department,COUNT(department) from worker group by department having COUNT(department)>2;
 

-- Foriegn key primary key link
create table student(
id INT NOT NULL AUTO_INCREMENT Primary key,
age INT 
);

insert into student VALUES(168,24);

CREATE table library_details(
Book_pic_id INT NOT NULL AUTO_INCREMENT Primary key,
stu_id integer,
FOREIGN key(stu_id) references student(id)
);

insert into library_details  VALUES(16,168);

-- Add unique Constraints

CREATE TABLE Student(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE
);

-- Check 
use e;
CREATE TABLE account(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance int,
CONSTRAINT chk_blc CHECK(balance>1000)
);

--  insert into account  VALUES(169,'k',168);  Throw Error
insert into account  VALUES(160,'i',1698);

-- to delete a table 
drop table tableName;

-- Default Set  , If you not insert balance value then its by default will be deafault value.
balance int not NULL deafault 0

--Add new column 
ALTER TABLE student ADD heightInFoot float not null default 5.6;

--Modify Data Type Of A column
ALTER TABLE student modify heightInFoot Double not null default 5.6;

-- DESC says field key null/not null data type
DESC student;


-- This Works age ,height
insert into t VALUES (20,23),(34,67.78); 
-- Insert in Customize order
insert into t (height,age) VALUES (34.56,56),(45.67,67);



