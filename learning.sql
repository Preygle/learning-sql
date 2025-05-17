CREATE TABLE employes(
	emp_id INT,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    rate DECIMAL(3,2),
    hire_date DATETIME
)

SELECT * FROM employes;

RENAME TABLE employes TO staff;
#DROP TABLE staff

ALTER TABLE staff
ADD phone_num VARCHAR(10);

SELECT * FROM staff;

USE test;

SHOW VARIABLES LIKE 'datadir';


ALTER TABLE staff 
RENAME COLUMN hire_time TO hire_date;

ALTER TABLE staff 
MODIFY COLUMN rate decimal(4,2);

ALTER TABLE staff 
MODIFY COLUMN hire_date date;

#AFTER l_name; #or FIRST for first column

#ALTER TABLE staff
#DROP COLUMN rate; #remove column rate

INSERT INTO staff (emp_id, f_name, l_name, phone_num, rate, hire_date)
VALUES(1, "Mohammad", "Owais", "7991503923", 15.75, "2025-05-17"),
	(2, "Anjali", "Verma", "9812345678", 20.50, "2025-05-16"),
	(3, "Rohan", "Singh", "9123456789", 18.00, "2025-05-15"),
	(4, "Sneha", "Sharma", "9876543210", 22.75, "2025-05-14"),
	(5, "Amit", "Kumar", "9765432187", 19.25, "2025-05-13");

SELECT * FROM staff;

INSERT INTO staff(emp_id, f_name, l_name)
VALUES(6, "Preygle", "Pandey");
SELECT * FROM staff;

SELECT f_name, phone_nuam FROM staff;

SELECT f_name
FROM staff
WHERE emp_id = 1;

SELECT f_name
FROM staff
WHERE  rate > 18;

SELECT *
FROM staff
WHERE rate IS NULL; #IS NOT NULL for inverse query

UPDATE staff
SET l_name = NULL, phone_num = "123456789", rate = 16.69
WHERE emp_id = 6;




