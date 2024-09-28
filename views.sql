Create Database organization;

Use organization;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept_id INT,
    role VARCHAR(50)
);



INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (1, 'Rahul', 'Sharma', 45000, 1, 'IT_PROG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (2, 'Pratik', 'Gajne', 67000, 2, 'ML_ENGG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (3, 'Nresh', 'Bhatt', 48000, 1, 'IT_PROG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (4, 'Nisha', 'Shetty', 65000, 1, 'IT_PROG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (5, 'Vishal', 'Kumar', 56000, 2, 'TESTER');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (6, 'Niranjan', 'Pandey', 43000, 1, 'IT_PROG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (7, 'Simran', 'Mehta', 56000, 1, 'SUPPORT');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (8, 'Vipul', 'Shekhawat', 67000, 2, 'SUPPORT');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (9, 'Binay', 'Gosh', 32000, 1, 'IT_PROG');

INSERT INTO employee (id, first_name, last_name, salary, dept_id, role)
VALUES (10, 'Nitin', 'Rao', 54000, 2, 'TESTER');

SELECT * FROM employee;

CREATE TABLE department(
id int,
dept_name VARCHAR(10)
);

DESC department;


INSERT INTO department VALUES(1,"IT"),
(2,"CS");

SELECT * FROM department;

-- 1)
CREATE VIEW EmployeeView AS 
SELECT id,first_name,last_name,role FROM employee WHERE role="IT_PROG";

SELECT * FROM EmployeeView;                                               

-- 2)
CREATE VIEW EmployeeView1 as(
SELECT * FROM Employee );

INSERT INTO EmployeeView1 Value(11,"Piyush","Bansal",52000,2,"Data Analyst");
SELECT * FROM EmployeeView1; 
  
-- 3)

CREATE VIEW EmployeeView2 as(
SELECT * FROM Employee );

UPDATE EmployeeView2 SET role= "IT_PROGRAMMER" WHERE role="IT_PROG" ;

SELECT * FROM EmployeeView2;

-- 4)

CREATE VIEW EmployeeView3 as(
SELECT * FROM Employee );

DELETE FROM EmployeeView3 WHERE id=5;

SELECT * FROM EmployeeView3;

-- View 2

CREATE VIEW EmployeeDetails AS
SELECT id,first_name,last_name,salary FROM employee
WHERE salary>(SELECT AVG(salary) FROM employee);

SELECT * FROM EmployeeDetails;

-- View 3

CREATE VIEW EmployeeDet AS
SELECT e.id,e.first_name,e.last_name,e.salary,d.dept_name FROM employee e
INNER JOIN department d
ON
e.dept_id=d.id;

SELECT * FROM EmployeeDet;


DELIMITER $
CREATE PROCEDURE get_employee1()
BEGIN

	SELECT * FROM employee1;

END$
DELIMITER ;