-- To create database
CREATE DATABASE guru;

-- to see all databases
SHOW DATABASES;

-- to use database (USE db_name)
USE guru;

-- To see tables
SHOW TABLES;

-- To delete database (Drop Database db_name)
DROP DATABASE guru;

-- To Create table

CREATE TABLE employee(
 employee_id INT,
 first_name VARCHAR(60),
 last_name VARCHAR(60)
); 


-- 2nd table

CREATE TABLE student(
roll_no INT,
student_name VARCHAR(60),
age INT,
birth_date DATE
);


--  show info of table

DESC student;

-- To add column to existing table
-- Alter Table <table-name> ADD COLUMN <column-name> <data-type>

ALTER TABLE student ADD COLUMN address VARCHAR(60);

-- Alter Table <table-name> ADD COLUMN <column-name> <data-type> AFTER <existing_col_name>

ALTER TABLE student ADD COLUMN contact_number INT AFTER age;

-- Alter Table <table-name> ADD COLUMN <column-name> <data-type> FIRST <existing_col_name>

ALTER TABLE student ADD COLUMN college_name VARCHAR(50) FIRST; 

-- ALTER TABLE <table-name> DROP COLUMN <column-name>;

ALTER TABLE student DROP COLUMN contact_number;

DESC student;

DROP TABLE student;

Create Table library(
	library_name VARCHAR(50),
    library_id INT,
	teacher_name VARCHAR(60)
);


-- To rename column along with datatype
ALTER TABLE library CHANGE library_id l_id CHAR(4);

DESC library;

-- To rename table 
ALTER TABLE library RENAME TO college_library;

SHOW TABLES;
 

DESC college_library;

CREATE DATABASE xyz_company;

USE xyz_company;

CREATE TABLE department(
department_id CHAR(2),
department_name VARCHAR(50)
);

SHOW TABLES;

DESC department;

-- INSERT INTO <table-name> VALUES (v1,v2,v3....)

INSERT INTO department VALUES ("D1","IT");

SELECT * FROM department;

INSERT INTO department (department_id) VALUES ("D2");

INSERT INTO department VALUES ("D3","CS");

INSERT INTO department (department_name,department_id) VALUES ("AI","D4");

Create TABLE employee(
employee_id INT,
employee_name VARCHAR(70),
employee_age INT
);

DESC employee;

INSERT INTO employee VALUES ("1","ABC","18");
INSERT INTO employee (employee_id,employee_name) VALUES ("2","PQR");
INSERT INTO employee VALUES ("3","XYZ","21");

SELECT * FROM employee;

INSERT INTO employee VALUES
(4,"MNO",28),
(5,"EFG",24),
(6,"IJK",30);

INSERT INTO employee (employee_id,employee_name) VALUES
(7,"STU"),
(8,"WXY");

CREATE TABLE course(
course_id INT,
course_name VARCHAR(50),
student_name VARCHAR(50),
student_fees INT
);

INSERT INTO course VALUES 
(1,"Java FSD","Guru",148000),
(2,"Python FSD","Amit",148000),
(3,"Java FSD","Joel",150000),
(4,"Python FSD","Shriya",122000),
(5,"Java FSD","Rayyan",115000),
(6,"Java FSD","Netrali",148000);

SELECT * FROM course;

INSERT INTO course (course_id,course_name,student_name) VALUES 
(7,"Python FSD","Hamza"),
(8,"Java FSD","Faizan");

DROP  TABLE department;

CREATE TABLE department(
department_id INT UNIQUE NOT NULL,
department_name VARCHAR(50) NOT NULL
);

SHOW TABLES;
DESC department;

INSERT INTO department VALUES(101,"GURU");
SELECT * FROM department;

INSERT INTO department VALUES(101,"xyz");
INSERT INTO department VALUES(102,null);


DROP TABLE employee;

CREATE TABLE employee(
employee_id CHAR(2) PRIMARY KEY,
employee_name VARCHAR(60) NOT NULL,
employee_email VARCHAR(60) UNIQUE NOT NULL
);

DESC employee;

-- To add Not null constraint
-- ALTER TABLE <table-name> MODIFY <col-name> <data-tyoe> NOT NULL;

-- TO remove not null constraint
-- Alter Table <table-name> MODIFY <col-name> <data-type>;

ALTER TABLE employee MODIFY employee_name VARCHAR(60); 

ALTER TABLE employee MODIFY employee_name VARCHAR(60) NOT NULL;

SHOW INDEXES FROM employee;

ALTER TABLE employee DROP INDEX employee_email;

ALTER TABLE employee ADD UNIQUE (employee_email);

ALTER TABLE employee DROP PRIMARY KEY;

DESC employee;




ALTER TABLE employee ADD PRIMARY KEY (employee_id);

ALTER TABLE employee ADD COLUMN employee_salary INT;
DESC employee;

ALTER TABLE employee ALTER employee_salary SET DEFAULT (40000);

SELECT * FROM employee;

DESC employee;
INSERT INTO employee (employee_id,employee_name,employee_email) VALUES 
("E2","Guru","g@gmail.com");


ALTER TABLE employee ALTER employee_salary DROP DEFAULT;

INSERT INTO employee VALUES 
("E3","G","g1@gmail.com",30000);

-- ALTER TABLE <table-name> ADD CONSTRAINT <constraint_name> CHECK (condition);
ALTER TABLE employee ADD CONSTRAINT check_salary CHECK (employee_salary>=0);
INSERT INTO employee VALUES 
("E4","G1","g2@gmail.com",10000);


-- ALTER TABLE <table-name> DROP CONSTRAINT check_salary;

ALTER TABLE employee DROP CONSTRAINT check_salary;


CREATE TABLE category(
c_id INT PRIMARY KEY,
name VARCHAR(60)
);

ALTER TABLE category MODIFY name VARCHAR(50) NOT NULL;

DESC category;


CREATE TABLE product( 
p_id INT PRIMARY KEY,
p_name VARCHAR(60) NOT NULL,
p_price INT DEFAULT 0 CHECK (p_price>=0),
c_id INT,
CONSTRAINT product_category FOREIGN KEY (c_id)
REFERENCES category(c_id)
);

DESC product;

INSERT INTO category VALUES (1,"Guru");
INSERT INTO category VALUES (2,"Electronics");

SELECT * FROM category;

INSERT INTO product VALUES(2,"Laptop",50000,2);

SELECT * FROM product;

DESC category;



CREATE TABLE school(
s_id INT PRIMARY KEY,
s_name VARCHAR(60) NOT NULL
);

DESC school;

CREATE TABLE student(
roll_no INT PRIMARY KEY,
st_name VARCHAR(60) NOT NULL,
Phone_no BIGINT,
s_id INT,
CONSTRAINT student_school FOREIGN KEY(s_id)
REFERENCES school(s_id)
);

DESC student;

INSERT INTO school VALUES(1,"Holy Cross High School"),
(2,"Khalsa");

SELECT * FROM school;

INSERT INTO student VALUES(111,"Gurjeet",348973247,1),
(222,"Guru",73247,2);


DROP TABLE school;
DROP TABLE student;


CREATE TABLE courses (
c_id INT PRIMARY KEY,
c_name VARCHAR(60) NOT NULL
);

CREATE TABLE teacher(
t_id INT PRIMARY KEY,
t_name VARCHAR(60),
t_num BIGINT,
c_id INT,
CONSTRAINT teacher_course FOREIGN KEY(c_id)
REFERENCES courses(c_id)
);

DROP TABLE teacher;

DESC courses;
DESC teacher;

-- Product & Category




-- Drop foreign key throught alter

ALTER TABLE product DROP FOREIGN KEY product_category;

DESC product;
INSERT INTO product VALUES(120,"tshirt",520,100);

SELECT * FROM product;

INSERT INTO category values(100,"Clothes");


-- Add foreign key throught alter

ALTER TABLE product ADD CONSTRAINT product_category
FOREIGN KEY (c_id) REFERENCES category(c_id);

USE xyz_company;

INSERT INTO product VALUES(130,"pants",600,100);

SELECT * FROM product;
DESC product;

--
select(100>45);
select(100<45); 
select(100=100);
select(100!=100);
select(500<=200);
select(60<=100);

-- and (ALL statements shoukd be true)

select(100=100 and 10=5 and 5<10);
select not(100=100 and 10>=5 and 7<10);

-- or (Atleast 1 statement need to be true)

select(100<200 or 200<=100);
select(100<200 or 500=500);
select not(200<1 or 1>=100);

-- like , between , In(in shortcut of or)

-- 

CREATE TABLE department1(
d_id INT PRIMARY KEY,
department VARCHAR(60) NOT NULL
);

CREATE TABLE employee1(
e_id INT PRIMARY KEY,
ename VARCHAR(60),
city VARCHAR(60),
salary BIGINT,
d_id INT,
CONSTRAINT employee_department FOREIGN KEY(d_id)
REFERENCES department1(d_id)
);

DESC department1;
DESC employee1;


INSERT INTO department1 VALUES(1,"Marketing"),
(2,"IT"),
(3,"Human Resource");

SELECT * FROM department1;

INSERT INTO employee1 VALUES(111,"Nikita","Mumbai",67000,1,23),
(112,"Prajakta","Pune",80000,1,25),
(113,"Manisha","Banglore",20000,2,29),
(114,"Nilesh","Mumbai",35469,3,22),
(115,"Monal","Pune",34452,2,20);

SELECT * FROM employee1;

-- SELECT col_name1,.... from table_name;

USE xyz_company;


SELECT e_id FROM employee1;
SELECT ename,salary AS emp_salary FROM employee1;
SELECT d_id FROM department1;

-- AS(Alias) is used to change column name temporarily

SELECT (10>7) AS answer;

-- ------------------------------------------------------------------------------------------------------------------
-- WHERE Clause 

SELECT * FROM employee1 WHERE e_id="111";

SELECT ename,salary FROM employee1 WHERE e_id="111";

SELECT d_id FROM employee1 WHERE e_id="111";

SELECT * FROM employee1 WHERE city="mumbai";

SELECT * FROM employee1 WHERE salary<50000;

SELECT * FROM employee1 WHERE salary<50000 AND city="mumbai";

SELECT * FROM employee1 WHERE city="mumbai" OR city="banglore";

SELECT * FROM employee1 WHERE salary between 10000 and 50000;

SELECT * FROM employee1 WHERE salary>=10000 and salary<=70000;

SELECT * FROM employee1 WHERE d_id="1" and salary<=20000;

SELECT * FROM employee1 WHERE d_id="1" and city="pune";

SELECT * FROM employee1 WHERE e_id="111" OR e_id="112" OR e_id="113";
SELECT * FROM employee1 WHERE e_id IN(111,112,113);

SELECT * FROM employee1 WHERE city IN("mumbai","pune","banglore");

-- BETWEEN 
SELECT * FROM employee1 WHERE salary BETWEEN 20000 AND 50000;


ALTER TABLE employee1 ADD COLUMN age INT;
DESC employee1;

SELECT * FROM employee1;

UPDATE employee1 set age=0;
UPDATE employee1 set age=25 WHERE e_id="111";
UPDATE employee1 set age=30 WHERE e_id="112";
UPDATE employee1 set age=27 WHERE e_id="113";
UPDATE employee1 set age=22 WHERE e_id="114" OR e_id="115";

UPDATE employee1 set city="Pune" WHERE e_id="111";
UPDATE employee1 set city="Mumbai" WHERE e_id="112";

UPDATE employee1 set salary=salary+5000 WHERE e_id="115";

UPDATE employee1 set age=age+2;

UPDATE employee1 set salary=salary-2000 WHERE d_id="1";


UPDATE employee1 set city=null WHERE e_id IN(111,113);

-- IS
SELECT * FROM employee1 WHERE city IS NULL;
SELECT * FROM employee1 WHERE city IS NOT NULL;


SELECT * FROM employee1;

SELECT * FROM employee1 WHERE e_id IN(112,113,114,115);
SELECT * FROM employee1 WHERE e_id!=111;
SELECT * FROM employee1 WHERE ename!="nikita";

use xyz_company;

-- LIKE

SELECT * FROM employee1 WHERE ename LIKE "n%";
SELECT * FROM employee1 WHERE ename LIKE "n%a";
SELECT * FROM employee1 WHERE ename LIKE "m_n%";
SELECT * FROM employee1 WHERE ename LIKE "m_n_s%";
SELECT * FROM employee1 WHERE ename NOT LIKE "m_n%";
SELECT * FROM employee1 WHERE ename LIKE "%n%";
SELECT * FROM employee1 WHERE ename NOT LIKE "m%";
SELECT * FROM employee1 WHERE ename LIKE "%ta";
SELECT ename FROM employee1 WHERE city LIKE "m%" AND ename LIKE "p%";
SELECT * FROM employee1 WHERE ename LIKE "%t_";

-- DELETE FROM <table-name> WHERE condition;

DELETE FROM employee1 WHERE e_id="114";
DELETE FROM employee1 WHERE d_id="1" AND age<30;
DELETE FROM employee1 WHERE ename LIKE "%l";
DELETE FROM employee1;

-- truncate and delete will delete  records in tables and drop will  delete table.
-- delete is mostly used with where clause

TRUNCATE TABLE employee1;
SELECT * FROM employee1;

-- Aggregate functions
-- function is build-in logic (joh phele se he bana hai)-- 

-- sum
-- count
-- min
-- max
-- avg   12+12+10/3

SELECT COUNT(*) AS no_of_employees FROM employee1; 
SELECT * FROM employee1;
SELECT COUNT(*) AS no_of_departments FROM department1;

-- DISTINCT will not show repeated values
SELECT DISTINCT city FROM employee1;
SELECT * FROM department1;

INSERT INTO employee1 VALUES(116,"Guru",null,90000,1,20);

SELECT COUNT(DISTINCT city) FROM employee1;

SELECT COUNT(DISTINCT d_id) FROM employee1;

-- min & max
SELECT MIN(salary) FROM employee1;
SELECT MIN(age) FROM employee1;

SELECT MAX(salary) FROM employee1;

-- sum
SELECT SUM(salary) FROM employee1;
SELECT SUM(salary*12) FROM employee1;

SELECT SUM(salary)*12 FROM employee1; 

-- avg

SELECT AVG(salary) FROM employee1;
SELECT AVG(age) FROM employee1;

-- order by (ASC by default & DESC)
SELECT * FROM employee1 ORDER BY salary;
SELECT * FROM employee1 ORDER BY salary DESC;

SELECT * FROM employee1 ORDER BY age;
SELECT * FROM employee1 ORDER BY age DESC;

SELECT * FROM employee1 ORDER BY ename;

UPDATE employee1 set salary=80000 WHERE e_id="111";


SELECT * FROM employee1;

SELECT * FROM employee1 ORDER BY salary DESC,age DESC;

use xyz_company;
-- 

SELECT * FROM employee1 ORDER BY salary LIMIT 1;
SELECT * FROM employee1 ORDER BY salary DESC,age DESC LIMIT 3;
SELECT * FROM employee1 ORDER BY age LIMIT 1;
SELECT * FROM employee1 ORDER BY age DESC LIMIT 1;

-- Group BY

SELECT d_id,count(e_id) FROM employee1
GROUP BY d_id;

SELECT city,count(e_id) FROM employee1
GROUP BY city;

SELECT city,sum(salary),avg(salary),min(salary),max(salary),count(e_id)
FROM employee1 GROUP BY city;

SELECT d_id,
sum(salary) AS total_salary,
avg(salary) AS avg_salary,
min(salary) AS min_salary,
max(salary) AS max_salary,
count(e_id) AS Total_count
FROM employee1
GROUP BY d_id;

SELECT * FROM employee1;

-- add column
ALTER TABLE employee1 ADD COLUMN gender VARCHAR(60);

-- add or update values in column
UPDATE employee1 set gender="F";
UPDATE employee1 set gender=null WHERE e_id="113" ;
UPDATE employee1 set gender="M" WHERE e_id="114" ;

SELECT gender,count(e_id) AS total_count FROM employee1 
GROUP BY gender;

-- you cant use WHERE clause after applying GROUP BY so instead we use HAVING
SELECT gender,count(e_id)
FROM employee1 GROUP BY gender HAVING gender="F";

-- kitne females ki salary means group by 

SELECT count(*) FROM employee1 WHERE salary<50000 AND gender="F";

SELECT gender ,count(e_id) FROM employee1  WHERE salary<50000 
GROUP BY gender HAVING gender="F";

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 WHERE salary<50000
GROUP BY d_id;

-- same

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id HAVING avg(salary)<50000 OR salary_avg<50000;

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id ORDER BY salary_avg LIMIT 1;

SELECT d_id,avg(salary) AS salary_avg  
FROM employee1 
GROUP BY d_id ORDER BY salary_avg DESC LIMIT 1;

SELECT d_id,count(e_id) AS total_emp
FROM employee1
GROUP BY d_id ORDER BY total_emp LIMIT 1;

SELECT d_id,sum(salary)
FROM employee1
GROUP BY d_id
ORDER BY sum(salary) LIMIT 1;


use xyz_company;

SELECT CONCAT ("Gurjeet","","Singh") AS name1;

SELECT * FROM employee1;

-- E1-Nikita
SELECT e_id,ename,concat(e_id,"-",ename) AS employee_details FROM employee1;

-- email e1.ename@itvedant.com

SELECT e_id,ename,concat(e_id,".",ename,"@itvedant.com") AS email FROM employee1;

-- UPPER("sql") SQL
-- used while taking input from user  

SELECT UPPER("sql");
SELECT LOWER("ABC");

INSERT INTO employee1 VALUES
("117","Ankita",LOWER("MUmbAi"),25900,1,26,UPPER("f"));

-- Length - Spaces are also included

SELECT LENGTH("  HELLO");
SELECT LENGTH("Nisha")>20;

SELECT ename,LENGTH(ename) FROM employee1;

-- H e l l o
-- 1 2 3 4 5
--                   starting point,how much characters you want to count  
SELECT substr("Hello",2,4);
SELECT substr("Hello",3,2);
SELECT substr("Hello",5,1);
SELECT substr("Gurjeet afsaf",LENGTH("Gurjeet afsaf"),1);

SELECT ename,substr(ename,Length(ename),1) AS last_char FROM employee1;


-- Flow will be length,substr,upper
SELECT ename,substr(UPPER(ename),Length(ename),1) AS last_char FROM employee1;

SELECT ename,concat(ename,"-",substr(UPPER(ename),Length(ename),1)) AS last_char FROM employee1;

SELECT ename,substr(lower(ename),1,1) FROM employee1;

SELECT ename,concat(substr(lower(ename),1,1),substr(Upper(ename),2,length(ename)-1)) AS change_letter FROM employee1;

--  2,4    2,3    2,5     2,5
--  Nikita Pooja Netrali Gurjeet 

SELECT ename,concat(substr(lower(ename),1,1),
substr(Upper(ename),2,length(ename)-2),
substr(lower(ename),length(ename),1))
AS change_alphabet FROM employee1;


-- mod(m,n)
-- mod means remainder

SELECT mod(71,3);
SELECT round(5.785,2);
SELECT CEIL(7.50);
SELECT FLOOR(12.75);
SELECT sqrt(17);

SELECT round(sqrt(17),4);

SELECT SIGN(-80);
SELECT SIGN(4);
SELECT SIGN(0);

SELECT TRUNCATE(5.6723478943,4);
SELECT ROUND(5.4729478943,3);

SELECT POW(5,3);

-- ----------------------------------------------------------------------------------------------------------

USE xyz_company;

SELECT round(AVG(salary)) AS avg_salary FROM employee1;

-- Date Related Functions
-- YYYY-MM-DD
SELECT curdate();
-- HH:MM:SS
SELECT curtime();
-- YYYY-MM-DD HH:MM:SS
SELECT NOW();

SELECT DATE("2024-10-10 07:25:20");
SELECT DATE(NOW());

SELECT DAY("2024-10-20");
SELECT YEAR("2024-10-20");

SELECT MONTH(curdate());

-- 
DESC employee1;
ALTER TABLE employee1 ADD COLUMN joining_date DATE;

SELECT * FROM employee1;

UPDATE employee1 SET joining_date="2023-04-02" WHERE e_id="111";
UPDATE employee1 SET joining_date="2024-01-24" WHERE e_id="112";
UPDATE employee1 SET joining_date="2021-05-17" WHERE e_id="113";
UPDATE employee1 SET joining_date="2024-01-30" WHERE e_id="114";
UPDATE employee1 SET joining_date="2020-12-15" WHERE e_id="115";
UPDATE employee1 SET joining_date="2022-10-10" WHERE e_id="117";

SELECT e_id,ename,joining_date,YEAR(joining_date) FROM employee1;


SELECT e_id,ename FROM employee1 WHERE YEAR(joining_date) IN ("2022","2023");

SELECT YEAR(joining_date)  AS joining_year,COUNT(e_id) AS totaL_emp
FROM employee1 GROUP BY YEAR(joining_date) HAVING joining_year=2024;

-- ---------------------------------------------------------------------

-- These Are placeholders
SELECT date_format("2024-11-21","%d-%m-%y");
SELECT date_format("2024-11-21","%d***%m-%y");

SELECT date_format("2024-11-21","%D-%M-%Y");

--  %w is a week number 0-sunday 1-momday 2-tues ....

SELECT date_format("2024-07-28","%D %M %Y %w");
SELECT date_format("2024-07-28","%D %M %Y %W");
SELECT date_format(now(),"%D %M %Y %H::%i::%s");

SELECT date_format(now(),"%D %b %Y %H::%i::%s");
SELECT date_format("2024-07-28","%D %M %Y %W");

-- if first condition is true it doesnt check next condition but if it's false then it goes to next condition

USE xyz_company;
SELECT * FROM employee1;

SELECT ename,salary,
CASE
	WHEN salary<30000 THEN "Very Less"
	WHEN salary<60000 THEN "Average"
    WHEN salary<100000 THEN "Very High"
    ELSE"-"
END AS salary_data,
CASE
	WHEN d_id=1 THEN "Marketing"
	WHEN d_id=2 THEN "IT"
    WHEN d_id=3 THEN "Human Resource"
    ELSE"-"
END AS department_details
FROM employee1;

UPDATE employee1 SET salary=
CASE
	WHEN d_id=1 THEN salary+2000
    WHEN d_id=2 THEN salary+4000
    WHEN d_id=3 THEN salary+2500
    ELSE salary
END;

SELECT * FROM employee1;

ALTER TABLE employee1 ADD COLUMN email VARCHAR(90);


-- focus (not done by you)
UPDATE employee1 set email=concat(LOWER(SUBSTR(city,1,1)),".",lower(ename),"_",e_id,"@itvedant.com");

-- COALESCE (First Non-null Value)

SELECT coalesce(null,12,45,65);
SELECT coalesce(null,null);
SELECT coalesce("NULL",null,null,10);

ALTER TABLE employee1 ADD COLUMN phone_number BIGINT;


UPDATE employee1 set phone_number=942243932,email=null WHERE e_id IN (111,112,113);

SELECT ename,email,phone_number,coalesce(email,phone_number) FROM employee1;


USE xyz_company;

SELECT datediff(curdate(),"2024-07-25");

SELECT * FROM employee1;

SELECT ename,joining_date,datediff(curdate(),joining_date) As no_of_days FROM employee1;

SELECT ename,joining_date,
CASE
	WHEN datediff(curdate(),joining_date)>365 THEN "more than 1 year"	
    ELSE"less than 1 year"
END AS total_year
FROM employee1;

-- date_add

SELECT date_add(curdate(), INTERVAL 70 day);
SELECT date_add(curdate(),INTERVAL 1 month);
SELECT date_add(curdate(),INTERVAL 1 year);
SELECT date_add(curdate(), INTERVAL -10 day);

-- Permanent Column
ALTER TABLE employee1 ADD COLUMN anniversary DATE;
SELECT * FROM employee1;
UPDATE employee1 set anniversary=date_add(joining_date,INTERVAL 1 year);
ALTER TABLE employee1 DROP COLUMN anniversary;

-- Temporary Column
SELECT *,
date_add(joining_date,INTERVAL 1 year) AS anniversary
FROM employee1;

-- ------------------------------------------------------------------------------------
-- Joins

SELECT * FROM employee1;
SELECT * FROM department1;

UPDATE employee1 SET d_id=null WHERE e_id=117;
INSERT INTO department1 values(4,"Operations");

-- INNER JOIN

SELECT * FROM employee1
INNER JOIN department1
ON
employee1.d_id=department1.d_id;

-- Shortcuts
SELECT e.ename,d.d_id,d.department FROM employee1 e
INNER JOIN department1 AS d
ON
e.d_id=d.d_id;


-- LEFT JOIN

-- ----------------------------------------------------------------------------
USE xyz_company;

SELECT * FROM employee1 e
LEFT JOIN department1 d
ON
e.d_id=d.d_id
ORDER BY e.salary DESC LIMIT 1;

SELECT * FROM employee1;
INSERT INTO department1 VALUE("D4","Operations"),
("D5","Sales");
INSERT  INTO employee1 (e_id,ename,city,salary,age) VALUE 
 (7,"Ankita","pune",50000,25);
 
-- RIGHT JOIN

CREATE VIEW right_join AS
SELECT e.*,d.department,d.department_city FROM employee1 e
RIGHT JOIN department1 d 
ON e.d_id=d.d_id
GROUP BY d.d_id
;

-- For Checking if column is null or not use IS ,dont use =
SELECT d.* FROM employee1 e
RIGHT JOIN department1 d 
ON e.d_id=d.d_id
WHERE e.d_id IS null
;


-- Cross JOIN (basically multiplication)

SELECT * FROM employee1,department1;

SELECT * FROM employee1 e,department1 d 
WHERE e.d_id=d.d_id AND e.d_id="1";


SELECT * FROM department1;
DESC department1;


CREATE TABLE department2(
d_id CHAR(2) PRIMARY KEY,
department_name VARCHAR(100),
city VARCHAR(150)
);

DESC department2;

INSERT INTO department_2 VALUES
("D1","Marketing","Mumbai"),
("D2","Training","Pune");

DELETE FROM department2 WHERE d_id="D2";
SELECT * FROM department2;
INSERT INTO department2 VALUE("D6","Training","Pune");

-- UNION JOIN (SHOWS ONLY DISTINCT VALUE NOT DUPLICATES)
-- Number of columns should match

SELECT d_id,department1 FROM department1
UNION 
SELECT d_id,department_name FROM department2;

-- UNION ALL (will also show repeated values)
SELECT d_id,department FROM department1
UNION ALL
SELECT d_id,department_name FROM department2;


-- -----------------------------------------------------------------------------------------------------------
--  Full Outer Joins
-- left table is priority jada 


SELECT * FROM employee1 e
LEFT JOIN department1 d
ON e.d_id=d.d_id
UNION
SELECT * FROM employee1 e
RIGHT JOIN department1 d
ON e.d_id=d.d_id;

-- Same Same But Different
SELECT * FROM employee1;

-- EQUI JOIN (Rarely Used)
-- Bus equal operator use hoyega
SELECT * FROM employee1 e, department1 d
WHERE e.d_id=d.d_id;

-- NON-EQUI JOIN
-- Koe Aur operator use kiya toh game khatam
SELECT * FROM employee1 e, department1 d
WHERE e.d_id=d.d_id AND e.salary<50000;

-- Subqueries

SELECT MIN(salary) FROM employee1;
SELECT * FROM employee1 WHERE salary=(SELECT MIN(salary) FROM employee1);

SELECT * FROM employee1;


SELECT MAX(salary) FROM employee1;
SELECT * FROM employee1 WHERE salary=86000;
SELECT * FROM employee1 WHERE salary=(SELECT MAX(salary) FROM employee1);

SELECT AVG(salary) FROM employee1;
SELECT * FROM employee1 WHERE salary<(SELECT AVG(salary) FROM employee1);


-- Logic Ques
SELECT * FROM employee1 ORDER BY salary DESC ; 
SELECT * FROM employee1 WHERE salary<(SELECT MAX(salary) FROM employee1)
ORDER BY salary DESC LIMIT 1;


SELECT d_id FROM department1 WHERE department="Marketing";
SELECT * FROM employee1 WHERE d_id=(SELECT d_id FROM department1 WHERE department="Marketing");


ALTER TABLE department1 ADD COLUMN department_city VARCHAR(100);
SELECT * FROM department1;
SELECT * FROM employee1;

UPDATE department1 SET department_city="MUMBAI" WHERE d_id=1;
UPDATE department1 SET department_city="PUNE" WHERE d_id=0;
UPDATE department1 SET department_city="MUMBAI" WHERE d_id=2;
UPDATE department1 SET department_city="BANGLORE" WHERE d_id=3;
UPDATE department1 SET department_city="MUMBAI" WHERE d_id=4;


SELECT d_id FROM department1 WHERE department_city="Mumbai";
SELECT * FROM employee1 WHERE d_id IN
(SELECT d_id FROM department1 WHERE department_city="Mumbai");

-- Subqueries is written in this () bracket
-- All means sabse bada yaa sabse chota 
-- Any means kissi se be bada ya chota

USE xyz_company;
SELECT * FROM employee1;


SELECT salary FROM employee1 WHERE ename="Manisha" OR ename="Nilesh";

SELECT * FROM employee1 WHERE salary>ALL(SELECT salary FROM employee1 WHERE ename="Manisha" OR ename="Nilesh");
SELECT * FROM employee1 WHERE salary<ALL(SELECT salary FROM employee1 WHERE ename="Monal" OR ename="Nilesh");

SELECT * FROM employee1 WHERE salary<=ANY(SELECT salary FROM employee1 WHERE ename="Manisha" OR ename="Nilesh");
SELECT * FROM employee1 WHERE salary>=ANY(SELECT salary FROM employee1 WHERE ename="Manisha" OR ename="Nilesh");

-- 

SELECT * FROM employee1 WHERE salary<
(SELECT salary FROM employee1 WHERE salary<
(SELECT max(salary) FROM employee1) ORDER BY salary DESC LIMIT 1) ORDER BY salary DESC LIMIT 1;

SELECT * FROM employee1 LIMIT 2,1;

SELECT max(age) FROM employee1;
SELECT * FROM employee1 WHERE age<(SELECT max(age) FROM employee1) ORDER BY age DESC LIMIT 1;


UPDATE employee1 SET d_id=1 WHERE e_id=117;
SELECT * FROM department1;

SELECT * FROM employee1 WHERE age<(SELECT max(age) FROM employee1) ORDER BY age DESC LIMIT 1;

-- mam method
SELECT * FROM department1 WHERE d_id=
(SELECT d_id FROM employee1 WHERE age=
(SELECT age FROM employee1 WHERE age<
(SELECT MAX(age) FROM employee1) ORDER BY age DESC LIMIT 1));

-- my method
SELECT * FROM department1 WHERE d_id=( SELECT d_id FROM employee1
WHERE age<(SELECT max(age) FROM employee1) ORDER BY age DESC LIMIT 1);
 
-- 7th August -----------------------------------------------------------------------------------------------------------------------------
-- Views


USE xyz_company;
CREATE VIEW department_salary AS
SELECT d_id,sum(salary) FROM employee1 GROUP BY d_id;

SELECT * FROM department_salary;

-- View can be used for security for hidding data
-- It is used for creating virtual tables

CREATE VIEW emp AS
SELECT e_id,city,d_id,age,gender FROM employee1;

SELECT * FROM emp;

-- duplicate columns will not be accepted in view
SELECT * FROM right_join;

--           Types Of Views
-- Simple View(if only 1 table is involved)
-- Complex View(more than 1 table involved)

-- For Droping View
DROP VIEW right_join;

-- 9th august---------------------------------------------------------------------------------------------

Delimiter is used to change the end

USE xyz_company;

DELIMITER $$

SELECT * FROM employee1$$
SELECT * FROM department1$$

-- IN OUT INOUT

/* STORED PROCEDURES (we can take input also)
DELIMITER $
CREATE PROCEDURE procedure_name()
BEGIN


END$
DELIMITER ;
*/

DELIMITER $
CREATE PROCEDURE get_employee1()
BEGIN

	SELECT * FROM employee1;

END$
DELIMITER ;

CALL get_employee1;

DELIMITER $
CREATE PROCEDURE get_department1_mumbai()
BEGIN

	SELECT * FROM department1 WHERE department_city="mumbai";

END$
DELIMITER ;

CALL get_department1_mumbai;

SELECT * FROM department1 ;

DELIMITER $
CREATE PROCEDURE get_by_city(IN city VARCHAR(100))
BEGIN
	SELECT * FROM employee1 WHERE employee1.city=city;
END$
DELIMITER ;

DROP PROCEDURE get_by_city;

CALL get_by_city("mumbai");

DESC department1;

DELIMITER $ 
CREATE PROCEDURE get_by_department(IN d_id INT(10))
BEGIN
	SELECT * FROM employee1 WHERE employee1.d_id=d_id;
END$
DELIMITER ;

DROP PROCEDURE get_by_department;

CALL get_by_department(2);

-- While calling its called argument
-- while declaring its called parameters

DELIMITER $ 
CREATE PROCEDURE update_phoneno(IN e_id INT(10),IN phone_number BIGINT)
BEGIN
	UPDATE employee1 SET employee1.phone_number=phone_number WHERE employee1.e_id=e_id;
END$
DELIMITER ;

DROP PROCEDURE update_phoneno;
DESC employee1;
CALL update_phoneno(117,124214142);
SELECT * FROM employee1;

-- 12th Aug 

USE xyz_company;
SET @salary=50000;
SELECT @salary;
SELECT * FROM employee1 WHERE salary<@salary;

DELIMITER $
CREATE PROCEDURE get_year(IN e_id INT(4),OUT reg_year INT)
BEGIN
	SELECT YEAR(joining_date) INTO reg_year FROM employee1 WHERE employee1.e_id=e_id;
END$
DELIMITER ;

DROP PROCEDURE get_year;

CALL get_year("112",@reg_year);
SELECT @reg_year;
SELECT * FROM employee1; 
SELECT * FROM employee1 WHERE YEAR(joining_date)=@reg_year;

-- self(khudse)

DELIMITER $
CREATE PROCEDURE get_age(IN e_id INT(4), OUT reg_name VARCHAR(100),OUT reg_age INT)
BEGIN 
	SELECT ename,age INTO reg_name,reg_age FROM employee1 WHERE employee1.e_id=e_id;
END$
DELIMITER ;
DROP PROCEDURE get_age;

CALL get_age("112",@reg_name,@reg_age);
SELECT @reg_name,@reg_age;

DELIMITER $ 
CREATE PROCEDURE get_gender(IN e_id INT(4), OUT reg_gender CHAR(4))
BEGIN
  SELECT gender INTO reg_gender FROM employee1 WHERE employee1.e_id=e_id;
END$
DELIMITER ;

CALL get_gender("114",@reg_gender);
SELECT @reg_gender;

-- getCount("Mumbai",@countemp)
-- getempdetail("d2")
-- getemployee("a")
-- getemployeecount("a",@countemp)

USE xyz_company;

-- 14th August 

DELIMITER $
CREATE PROCEDURE updatesalary(IN e_id CHAR(4),INOUT salary INT)
BEGIN
	DECLARE old_salary INT;
    SELECT employee1.salary INTO old_salary FROM employee1 WHERE employee1.e_id=e_id;
    UPDATE employee1 SET employee1.salary=salary WHERE employee1.e_id=e_id;
    SET salary=old_salary;
END$
DELIMITER ;

SET @salary=85000;
SELECT * FROM employee1;
CALL updatesalary(111,@salary);
SELECT @salary;


-- Function Syntax
/*
DELIMITER $
CREATE FUNCTION fun_name (p1,p2,....,pn)
RETURNS datatype
BEGIN
	//logic
    RETURN value;
END$
DELIMITER ;
*/

DELIMITER $
CREATE FUNCTION addition(a INT, b INT)
RETURNS INT
BEGIN
	RETURN a+b;
END $
DELIMITER ;

SELECT addition(200,500);


DELIMITER $
CREATE FUNCTION subtraction(a INT, b INT)
RETURNS INT
BEGIN 
	RETURN a-b;
END $
DELIMITER ;

SELECT subtraction(200,100);

SELECT UPPER(substr("Hello",1,1));
SELECT LOWER(substr("Hello",2));
SELECT CONCAT(UPPER(substr("Hello",1,1)),LOWER(substr("Hello",2)));

DELIMITER $
CREATE FUNCTION format_name(word VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
		RETURN CONCAT(UPPER(substr(word,1,1)),LOWER(substr(word,2)));
END $
DELIMITER ;

SELECT format_name("gUrjeET");
SELECT format_name(email),format_name(city) FROM employee1;
SELECT * FROM employee1;
SELECT addition(salary,10000) FROM employee1;

DELIMITER $
CREATE FUNCTION check_grade(marks INT)
RETURNS CHAR(20)
BEGIN 
	DECLARE grade char(20);
    SET grade=CASE
			  WHEN marks BETWEEN 0 AND 40 THEN "C"
              WHEN marks BETWEEN 41 AND 74 THEN "B"
			  WHEN marks BETWEEN 75 AND 100 THEN "A"	
              ELSE
				"INVALID MARKS"
			  END;
	RETURN grade;
END$
DELIMITER ;

DROP FUNCTION check_grade;

SELECT check_grade(1220);

-- 16th August

/*
Syntax :
IF condition THEN 
	statements
END IF;

IF condition THEN
		statement1
ELSE 
		statement2
END IF;
*/

USE xyz_company;

DELIMITER $
CREATE FUNCTION check_number(n int)
RETURNS VARCHAR(4)
BEGIN
	IF (n%2=0) THEN
		RETURN "EVEN";
	ELSE
		RETURN "ODD";
	END IF;
END$
DELIMITER ;

SELECT check_number(101);

DELIMITER $
CREATE FUNCTION check_age(age int)
RETURNS BOOLEAN
BEGIN
	IF (age>18) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END$
DELIMITER ;

DROP FUNCTION check_age;
SELECT check_age(12);

/*
IF condition THEN 
	statement1
ELSEIF condition THEN
	statement2
ELSEIF condition THEN
	statement3
.
.
.
ELSE statementn
END IF;
*/


-- Case me insert nhi kara sakte 
-- Case me by default return he hota hai

-- 1:Eng 2:Marathi 3:Hindi

DELIMITER $
CREATE FUNCTION choose_language(choice INT)
RETURNS VARCHAR(20)
BEGIN
	IF (choice=1) THEN
		RETURN "English";
	ELSEIF (choice=2) THEN
		RETURN "Marathi";
	ELSEIF (choice=3) THEN
		RETURN "HINDI";
	ELSE 
		RETURN "Invalid Input";
	END IF;
END$
DELIMITER ;

SELECT choose_language(1);

DELIMITER $
CREATE FUNCTION check_day(choice INT)
RETURNS VARCHAR(20)
BEGIN
	IF (choice=1) THEN
		RETURN "Monday";
	ELSEIF (choice=2) THEN
		RETURN "Tuesday";
	ELSEIF (choice=3) THEN
		RETURN "Wednesday";
	ELSEIF (choice=4) THEN
		RETURN "Thursday";
	ELSEIF (choice=5) THEN
		RETURN "Friday";
	ELSEIF (choice=6) THEN
		RETURN "Saturday";
    ELSEIF (choice=7) THEN
       RETURN "Sunday";    
	ELSE 
		RETURN "Invalid";
	END IF;
END$
DELIMITER ;

SELECT check_day(4);


-- 19th August (Loop)

USE xyz_company;

DELIMITER $
CREATE FUNCTION select_course (choice INT)
RETURNS VARCHAR(30)
BEGIN
	IF (choice=1) THEN
		RETURN "Java FSD";
	ELSEIF (choice=2) THEN 
		RETURN "Python FSD";
	ELSEIF (choice=3) THEN 
		RETURN "Data Science With AI";
	ELSE 
		RETURN "Invalid Input";
	END IF;
END$
DELIMITER ;

SELECT select_course(1);

-- Loop
-- 2 types of loop in sql (basic loop,while loop)

-- syntax
/*
labelName: LOOP
IF condition THEN
	LEAVE labelName;
END IF;
END LOOP labelName;
*/

--  basic loop :-Jab  value true hoyegi tab loop band
-- Ex: jab 100 rs milega tab kaam band

Delimiter $
CREATE PROCEDURE loopExample()
BEGIN
	DECLARE i INT;
    SET i=1;
	
	simpleLoop:LOOP
		IF i=6 THEN
			LEAVE simpleLoop;
		END IF;
		SELECT "HELLO";
        SET i=i+1;
	END LOOP simpleLoop;
END$
DELIMITER ;

CALL loopExample();

Delimiter $
CREATE PROCEDURE print1to5()
BEGIN
	DECLARE i INT;
    SET i=1;
	
	simpleLoop:LOOP
		IF i=6 THEN
			LEAVE simpleLoop;
		END IF;
		SELECT i;
        SET i=i+1;
	END LOOP simpleLoop;
END$
DELIMITER ;

CALL print1to5();

USE xyz_company;
SHOW TABLES;
DESC emp;

CREATE TABLE emp1(emp_id VARCHAR(10));


SELECT CONCAT("EMP",1);
SELECT CONCAT("EMP",2);
SELECT CONCAT("EMP",3);

INSERT INTO emp1 VALUES(CONCAT("EMP",1));
SELECT * FROM emp1;
TRUNCATE emp1;
DROP PROCEDURE add_emp_id;


Delimiter $
CREATE PROCEDURE add_emp_id()
BEGIN
	DECLARE i INT;
    SET i=1;
	simpleLoop:LOOP
		IF i=6 THEN
			LEAVE simpleLoop;
		END IF;
		INSERT INTO emp1 VALUES (CONCAT("EMP",i));
        SET i=i+1;
	END LOOP simpleLoop;
END$
DELIMITER ;

CALL add_emp_id();
SELECT * FROM emp1;

--  while loop :-Jab tak value true hai tab tak chalega 
-- Ex: jab tak 100 rs mil rhe hai kaam karo 
/*
labelName:WHILE
CONDITION DO
 //statement 
END WHILE labelName;
*/

-- make 10 ka table using while loop 

-- 20th August

USE xyz_company;

DELIMITER $
CREATE PROCEDURE whileLoopExample()
BEGIN
		DECLARE i INT;
        SET i=1;
        whileLoopExample:While
        i<=50 DO
		IF i%2=0 THEN
			SELECT i;
		END IF;
            SET i=i+1;
		END WHILE whileLoopExample;
END$
DELIMITER ;

DROP PROCEDURE whileLoopExample;
CALL whileLoopExample();

CREATE TABLE student1(s_id INT NOT NULL);
ALTER TABLE student1 MODIFY s_id INT PRIMARY KEY;
DESC student1;

INSERT INTO student1 VALUES(null);
INSERT INTO student1 VALUES(500);

-- exceptionHandling means error ko handle karna
-- exceptionHandling tab hoga jab error ayega

DELIMITER $
CREATE PROCEDURE exceptionHandling(IN s_id INT)
BEGIN
	DECLARE CONTINUE HANDLER FOR 1048
    BEGIN
		SELECT "You Cannot Insert Null Value";
    END;
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
		SELECT "Duplicate Values Cannot Be Added";
    END;
	INSERT INTO student1 VALUES(s_id);
    SELECT "Code After Insertion";
END$
DELIMITER ;

CALL exceptionHandling(500);

DROP PROCEDURE exceptionHandling;
SELECT * FROM student1;


-- 21st August

-- Cursor
-- implicit cursor
-- explicit cursor

-- Cursor trigger loop are pl/sql

-- Steps for Cursor
/*
1)Declare Cursor
	DECLARE cursor_name CURSOR FOR select query;
    DECLARE s CURSOR FOR SELECT id FROM students;
2)Open Cursor
	OPEN cursor_name;
    OPEN s;
3)Fetch Cursor
	FETCH cursor_name INTO variable_list;
    FETCH s INTO student_id;
4)Close Cursor
	CLOSE cursor_name;
    CLOSE s;
*/

-- Cursor will show error at the end to avoid that we use exception handling

USE java_student_management;
SELECT studentID,Name FROM students;

DELIMITER $
CREATE PROCEDURE cursorExample()
BEGIN
	DECLARE s_id INT;
	DECLARE s_name VARCHAR (100);
    
    DECLARE student_cursor CURSOR FOR
    SELECT studentID,Name FROM students;
    
    OPEN student_cursor;
    
    FETCH student_cursor INTO s_id,s_name;
    SELECT s_id,s_name;
    
    CLOSE student_cursor;
    
END$
DELIMITER ;

CALL cursorExample();
DROP PROCEDURE cursorExample;
