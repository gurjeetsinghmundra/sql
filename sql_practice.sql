CREATE DATABASE company;

SHOW DATABASES;
USE company;

CREATE TABLE employee(
id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_joining DATE
);

SHOW TABLES;

ALTER TABLE employee ADD COLUMN salary FLOAT;
DESC employee;

ALTER TABLE employee DROP COLUMN date_of_joining;

ALTER TABLE employee MODIFY COLUMN id INT PRIMARY KEY;