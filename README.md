CREATE TABLE employes (
    emp_id INT UNIQUE, #DEFAULT 00 # PRIMARY KEY AUTO_INCREMENT
    f_name VARCHAR(20), #UNIQUE
    l_name VARCHAR(20),
    rate DECIMAL(3 , 2 ),
    hire_date DATETIME
    #, FOREIGN KEY(COLUMN NAME TO ADD KEY) REFERENCES TABLE_B_NAME(COLUMN NAME OF PRIMARY KEY IN TABLE B)
) SELECT * FROM
    employes;

RENAME TABLE employes TO staff;
#DROP TABLE staff

ALTER TABLE staff
ADD phone_num VARCHAR(10);

SELECT 
    *
FROM
    staff;

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

SELECT 
    *
FROM
    staff;

INSERT INTO staff(emp_id, f_name, l_name)
VALUES(6, "Preygle", "Pandey");
SELECT 
    *
FROM
    staff;

SELECT 
    f_name, phone_nuam
FROM
    staff;

SELECT 
    f_name
FROM
    staff
WHERE
    emp_id = 1;

SELECT 
    f_name
FROM
    staff
WHERE
    rate > 18;

SELECT 
    *
FROM
    staff
WHERE
    rate IS NULL;UPDATE staff 
SET 
    l_name = NULL,
    phone_num = '123456789',
    rate = 16.69
WHERE
    emp_id = 6;
SELECT 
    *
FROM
    staff;

DELETE FROM staff 
WHERE
    emp_id = 5;
SELECT 
    *
FROM
    staff;

SET AUTOCOMMIT = OFF;
ROLLBACK;
COMMIT;
SET AUTOCOMMIT = ON;

INSERT INTO staff (emp_id, hire_date)
VALUES (6, current_date()); #current_time(), now(//date_time)

ALTER TABLE staff
ADD CONSTRAINT
UNIQUE(emp_id);

ALTER TABLE staff
MODIFY rate DECIMAL(4, 2) NOT NULL;
SELECT * FROM staff;

ALTER TABLE staff
ADD CONSTRAINT hrly_pay_lmt CHECK(rate > 9);

INSERT INTO staff
VALUES(7, "UZMA", "Ansari", 123464627, 6, "2023-09-14");
SELECT * FROM staff;

ALTER TABLE staff
DROP CONSTRAINT hrly_pay_lmt; 

ALTER TABLE staff
ALTER rate SET DEFAULT 11;
#USE CASE: ADD CURRENT DATE AND TIME BY USING DEFAULT NOW()

#PRIMARY KEY: NULL AND UNIQUE. 1 PER TABLE
ALTER TABLE staff
ADD CONSTRAINT PRIMARY KEY(emp_id);

#AUTO INCREMENT: BEGINS WITH 1, I++
#TO SET INIT VALUES. MUST DECLARE IT WITH TABLE CREATION
ALTER TABLE staff
AUTO_INCREMENT = 100;

#FOREIGN KEY: CONNECTS A COLUMN IN TABLE A TO PRIMARY KEY OF TABLE B, IF NO NAME SET, TO FIDN ANME OF FOREIGN KEY, CHECK ION SCHEMAS, FOREGIN KEY DATA CANT BE DELETED 
#DROP
ALTER TABLE staff
DROP FOREIGN KEY name;

#ADD NAME TO KEY
ALTER TABLE staff
ADD CONSTRAINT KEY_NAME
FOREIGN KEY(COLUMN NAME) REFERENCES TABLE_NAME(COLUMN CONTAINING PRIM KEY);












