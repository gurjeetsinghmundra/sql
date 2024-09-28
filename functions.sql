CREATE DATABASE organization_3;

USE organization_3;

CREATE TABLE employee_grade (
    first_name VARCHAR(50),
    salary INT
);

INSERT INTO employee_grade (first_name, salary)
VALUES 
('Rahul', 56000 ),
('Pravin', 25000 ),
('Naresh', 8000)
('Amit',50000;

DROP TABLE employee_grade;


DELIMITER $
CREATE FUNCTION assign_grade(salary INT)
RETURNS CHAR
BEGIN 
		DECLARE grade char(1);
	IF salary <= 10000 THEN
        SET grade = 'D';
    ELSEIF salary > 10000 AND salary <= 30000 THEN
        SET grade = 'C';
    ELSEIF salary > 30000 AND salary <= 60000 THEN
        SET grade = 'B';
    ELSEIF salary>60000 THEN
        SET grade = 'A';
	ELSE
		RETURN "Invalid Marks";
    END IF;
	RETURN grade;

END$
DELIMITER ;

SELECT first_name,salary,assign_grade(salary) AS Grade FROM employee_grade;
