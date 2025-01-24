CREATE DATABASE organization_4;

USE organization_4;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary FLOAT
);

INSERT INTO employee (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123-456-7890', '2022-01-15', 101, 55000.50),
(2, 'Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '2021-12-10', 102, 62000.75),
(3, 'Michael', 'Johnson', 'michaelj@example.com', '456-789-1234', '2020-03-18', 103, 75000.00),
(4, 'Emily', 'Davis', 'emilydavis@example.com', '321-654-9870', '2019-07-22', 104, 48000.25),
(5, 'David', 'Miller', 'davidmiller@example.com', '789-123-4560', '2023-06-30', 105, 59000.90);


INSERT INTO employee (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES
(6, 'Rahul', 'Kumar', 'rahulkumar@example.com', '111-222-3333', '2023-02-15', 106, 87000),
(7, 'Pravin', 'Nalwade', 'pravinnalwade@example.com', '444-555-6666', '2021-09-23', 107, 66000),
(8, 'Preeti', 'Reddy', 'preetireddy@example.com', '777-888-9999', '2020-05-18', 108, 46000);

SELECT first_name,last_name,email,salary FROM employee;

SELECT * FROM employee;

-- 1)
DELIMITER $
CREATE PROCEDURE Detail_info()
BEGIN
	
    DECLARE f_name VARCHAR(100);
    DECLARE l_name VARCHAR(100);
	DECLARE e VARCHAR(100);
	DECLARE sal INT;
	DECLARE n INT;
    
    DECLARE employee_cursor CURSOR FOR
    SELECT first_name,last_name,email,salary FROM employee;
    
    DECLARE CONTINUE HANDLER FOR 1329
    BEGIN
		SET n=1;
    END;
    
    OPEN employee_cursor;
    
	cursorLoop:LOOP
    FETCH employee_cursor INTO f_name,l_name,e,sal;
	IF n=1 THEN
    
		LEAVE cursorLoop;
		END IF;
    
		SELECT f_name,l_name,e,sal;
    END LOOP cursorLoop;
    CLOSE employee_cursor;
    
END$
DELIMITER ;

CALL Detail_info();	


-- 2)

DELIMITER $

CREATE PROCEDURE GetEmployeeGrades()
BEGIN
    
	DECLARE f_name VARCHAR(100);
    DECLARE l_name VARCHAR(100);
	DECLARE sal INT;
    DECLARE g VARCHAR(20);

    DECLARE n INT;
    
    DECLARE emp_cursor CURSOR FOR
        SELECT first_name, last_name, salary
        FROM employee;
    
	DECLARE CONTINUE HANDLER FOR 1329
    BEGIN
		SET n=1;
    END;
	

    OPEN emp_cursor;

    cursorLoop:LOOP
        FETCH emp_cursor INTO f_name, l_name , sal;
        
      
		IF n=1 THEN
            LEAVE cursorLoop;
        END IF;

      
        IF sal > 80000 THEN
            SET g= 'Manager';
        ELSEIF sal BETWEEN 50000 AND 80000 THEN
            SET g = 'Associate';
        ELSE
            SET g = 'Executive';
        END IF;

    
        SELECT CONCAT( f_name,' ', l_name,' ' , sal,' ', g) AS Employee_Details;
    END LOOP;

   
    CLOSE emp_cursor;
END$

DELIMITER ;

CALL GetEmployeeGrades();

DROP PROCEDURE GetEmployeeGrades;