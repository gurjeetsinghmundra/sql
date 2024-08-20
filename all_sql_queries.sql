CREATE DATABASE xyz_company;
SHOW DATABASES;
USE xyz_company;
DROP DATABASE xyz_company;

CREATE TABLE student(
s_id INT PRIMARY KEY
);

SHOW TABLES;
DROP  TABLE student;
DESC student;

INSERT INTO student VALUES(500);
SELECT * FROM student;

ALTER TABLE student ADD COLUMN s_name VARCHAR(100) FIRST;
ALTER TABLE student MODIFY COLUMN s_name VARCHAR(120);
ALTER TABLE student DROP COLUMN s_name;
ALTER TABLE student ADD COLUMN s_email VARCHAR(100) AFTER s_name;

ALTER TABLE student CHANGE s_id stu_id INT(4);
ALTER TABLE student RENAME TO college_student;

INSERT INTO college_student (s_name,stu_id) VALUES
("STU",100),
("WXY",200);
SELECT * FROM college_student;

CREATE TABLE employee(
employee_id CHAR(2) PRIMARY KEY,
employee_name VARCHAR(60) NOT NULL,
employee_email VARCHAR(60) UNIQUE NOT NULL
);

DESC employee;

ALTER TABLE employee MODIFY employee_name VARCHAR(60); 
ALTER TABLE employee MODIFY employee_name VARCHAR(60) NOT NULL;

SHOW INDEXES FROM employee;
ALTER TABLE employee DROP INDEX employee_email;
ALTER TABLE employee ADD UNIQUE (employee_email);
ALTER TABLE employee DROP PRIMARY KEY;

ALTER TABLE employee ADD PRIMARY KEY (employee_id);

ALTER TABLE employee ADD COLUMN employee_salary INT;
ALTER TABLE employee ALTER employee_salary SET DEFAULT (40000);
SELECT * FROM employee;

INSERT INTO employee (employee_id,employee_name,employee_email) VALUES ("E2","Guru","g@gmail.com");
ALTER TABLE employee ALTER employee_salary DROP DEFAULT;
INSERT INTO employee VALUES ("E3","G","g1@gmail.com",30000);

ALTER TABLE employee ADD CONSTRAINT check_salary CHECK (employee_salary>=8000);
INSERT INTO employee VALUES ("E6","G3","g4@gmail.com",7000);

ALTER TABLE employee DROP CONSTRAINT check_salary;

-- Foreign Key

CREATE TABLE category(
c_id INT PRIMARY KEY,
name VARCHAR(60) NOT NULL
);

CREATE TABLE product( 
p_id INT PRIMARY KEY,
p_name VARCHAR(60) NOT NULL,
p_price INT DEFAULT 0 CHECK (p_price>=0),
c_id INT,
CONSTRAINT product_category FOREIGN KEY (c_id)
REFERENCES category(c_id)
);

DESC product;

INSERT INTO category VALUES (1,"Electronics");
INSERT INTO product VALUES(2,"Laptop",50000,1);

-- Drop foreign key throught alter
ALTER TABLE product DROP FOREIGN KEY product_category;

-- Add foreign key throught alter
ALTER TABLE product ADD CONSTRAINT product_category
FOREIGN KEY (c_id) REFERENCES category(c_id);

INSERT INTO product VALUES(120,"tshirt",520,100);
INSERT INTO category values(100,"Clothes");

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
