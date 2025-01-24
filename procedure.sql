Create DATABASE organization_2;
USE organization_2;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary FLOAT,
    manager_id INT,
    dept_id INT
);


CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_id INT,
    location_id INT
);

ALTER TABLE employee
ADD CONSTRAINT fk_department
FOREIGN KEY (dept_id) REFERENCES department(dept_id);


INSERT INTO department (dept_id, dept_name, manager_id, location_id)
VALUES 
(1, 'HR', 101, 10),
(2, 'IT', 102, 11),
(3, 'Finance', 103, 12),
(4, 'Marketing', 104, 13),
(5, 'Sales', 105, 14);

INSERT INTO employee (emp_id, first_name, last_name, email, mobile, hire_date, job_id, salary, manager_id, dept_id)
VALUES 
(1001, 'John', 'Doe', 'john.doe@example.com', '1234567890', '2022-01-15', 201, 50000, 101, 1),
(1002, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2021-11-20', 202, 60000, 102, 2),
(1003, 'Mike', 'Johnson', 'mike.johnson@example.com', '9876543210', '2020-05-30', 203, 55000, 103, 3),
(1004, 'Emma', 'Brown', 'emma.brown@example.com', '4567890123', '2019-03-25', 204, 62000, 104, 4),
(1005, 'Liam', 'Williams', 'liam.williams@example.com', '7890123456', '2018-07-10', 205, 58000, 105, 5);

--  1
DELIMITER $
CREATE PROCEDURE get_employee()
BEGIN

	SELECT e.first_name,e.last_name,e.email,d.dept_name FROM employee e
	INNER JOIN
	department d
	On
	e.dept_id=d.dept_id;
END$
DELIMITER ;

CALL get_employee;

-- 2

DELIMITER $
CREATE PROCEDURE GetLimitedEmployee(In n  INT)
BEGIN

SELECT first_name,last_name,salary,hire_date FROM employee LIMIT n;

END$
DELIMITER ;

CALL GetLimitedEmployee(3);

-- 3 

DELIMITER $
CREATE PROCEDURE CountEmployee()
BEGIN

SELECT COUNT(*) AS total_emp_count FROM employee;

END$
DELIMITER ;


CALL CountEmployee();
