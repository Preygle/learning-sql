CREATE TABLE employes (
    emp_id INT UNIQUE, #DEFAULT 00 # PRIMARY KEY AUTO_INCREMENT
    f_name VARCHAR(20), #UNIQUE
    l_name VARCHAR(20),
    rate DECIMAL(3 , 2 ),
    hire_date DATETIME
    #, FOREIGN KEY(COLUMN NAME TO ADD KEY) REFERENCES TABLE_B_NAME(COLUMN NAME OF PRIMARY KEY IN TABLE B)
    #ON DELETE SET NULL
    #ON DELETE CASCADE	
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


CREATE TABLE customers (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE transactions (
    trans_id INT AUTO_INCREMENT PRIMARY KEY,
    rate DECIMAL(5,2),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
) AUTO_INCREMENT = 101;

INSERT INTO customers (first_name, last_name) VALUES 
('Rahul', 'Verma'), 
('Anjali', 'Sharma'), 
('Rohan', 'Mehta'), 
('Sneha', 'Patel'), 
('Amit', 'Kumar');

INSERT INTO transactions (rate, cust_id) VALUES 
(250.75, 1), 
(175.50, 3), 
(320.00, 2), 
(415.25, 2), 
(199.99, 4);

DROP TABLE TRANSACTIONS;
SELECT * FROM customers;
SELECT * FROM transactions;

#JOIN: join 2 tables based on come common value(primary key and foreign key)
SELECT trans_id, rate, first_name, last_name FROM transactions INNER JOIN customers
ON transactions.cust_id = customers.cust_id;

#use LEFT JOIN to fully display the table on left and the common values from table on right
#use RIGHT JOIN to fully display the table on right and the common values from table on left

SELECT COUNT(rate) AS count_rate
FROM transactions;

SELECT MAX(rate) AS max_value #MIN
FROM transactions;

SELECT SUM(rate) AS sum_of_rate #AVG
FROM transactions;

SELECT CONCAT(first_name, " ", last_name) AS name
FROM customers;

SELECT * FROM staff;

ALTER TABLE staff
ADD COLUMN eligibility VARCHAR(4) AFTER rate;

UPDATE staff
SET eligibility = "YES"
WHERE rate > 12 AND hire_date > "2025-05-14";
UPDATE staff
SET eligibility = "NO"
WHERE rate > 9 AND hire_date < "2025-05-14";

#OTHER OPERATORS OR, NOT, BETWEEN(AND ALTERNATIVE FOR RANGE) IN(CHECKS FOR VALUES BELINGING TO PARTICULAR SET)

SELECT * FROM staff;

#LIKE, REGEX IN SQL
# %: USE TO DENOTE RANDOM CHARACTERS WHICH MAY FOLLOW OR PRECEED A PARTICULAR CHARACTER SEQUENCE 
# _: USED TO REPRESENT 1 RANDOM CHARACTER(NOT A SEQUENCE) {GOOD FOR FINDING DATA AT A PARTICULAR DATE}
# CAN USE A COMBINATION OF THEM BOTH
SELECT * FROM staff
WHERE hire_date LIKE "2025%";

SELECT * FROM staff
WHERE hire_date LIKE "2025-05-1_";

#ORDER BY: ORDER TABLE BY VALUES BASED ON A COLUMN
SELECT * FROM staff
ORDER BY rate, hire_date DESC; # NO DESC = DEFAULT ASC # IF 2 VALUES SAME, ODER IS DONE BASED ON SECOND PARAMETER
 
#LIMIT: LIMITS THE NUMEBR OF DATA IN A ROW DISPLAYED
#LIMIT X, Y: DISPLAYS Y RECORDS AFTER X DATA
SELECT * FROM staff
ORDER BY rate DESC LIMIT 1, 1;

#UNION: JOIN 2 TABLES TOGETHER COLUMN WISE
SELECT trans_id, rate FROM transactions
UNION ALL #ALL INCLUDES DUPES
SELECT first_name, last_name FROM customers;

CREATE TABLE emp (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    job VARCHAR(50),
    hire_date DATE,
    supervisor_id INT
);

INSERT INTO emp (employee_id, first_name, last_name, hourly_pay, job, hire_date, supervisor_id) VALUES
(1, 'Eugene', 'Krabs', 25.50, 'manager', '2023-01-02', NULL),
(2, 'Squidward', 'Tentacles', 15.00, 'cashier', '2023-01-03', 5),
(3, 'Spongebob', 'Squarepants', 12.50, 'cook', '2023-01-04', 5),
(4, 'Patrick', 'Star', 12.50, 'cook', '2023-01-05', 5),
(5, 'Sandy', 'Cheeks', 17.25, 'asst. manager', '2023-01-06', 1),
(6, 'Sheldon', 'Plankton', 10.00, 'janitor', '2023-01-07', 5);

SELECT * FROM emp;

SELECT a.first_name, a.last_name, 
	   CONCAT(b.first_name, b.last_name) as supervisor
FROM
emp AS a
INNER JOIN
emp AS b
on b.employee_id = a.supervisor_id;

#VIEW: CREATES A SUBTABLE FOR A TABLE, (NO NEW TABLES ARE CREATED), IS ASSIGNS A NAME TO PARTICULAR GROUPS OF COLUMNS, ANY CHANGES AMDE TO THE PARENT TABLE REFLECTS ON THE VIEW

CREATE VIEW emp_name AS
SELECT first_name, last_name
FROM emp;

SELECT * FROM emp_name;

DROP VIEW emp_name; #DROPS THE VIEW

#INDEXES: makes findeing data easier(uses btree) but makes insertion more time consuming
SHOW INDEXES FROM emp;

CREATE INDEX l_name
ON emp(last_name);

ALTER TABLE emp
DROP INDEX l_name;

CREATE INDEX f_l_name
ON emp(first_name, last_name); #IF USING ONLY LAST NAME, INDEX IS NOT UTILIZED

#SUB QUERY: NORMAL QUERY(SUBQUERY) I.E. USE THE RESULT OF A SUBQUERY AS A VALUE STORES IN A VARIABLE
# FIRST THE INNER MOST QUERY IS IS RESOLVED, THE ITS DATA IS RETURNED AS IN INPUT TO THE OUTER QUERY
SELECT * FROM emp;

SELECT * FROM emp 
WHERE hourly_pay > 
(SELECT AVG(hourly_pay) FROM emp);


SELECT first_name, last_name FROM customers
WHERE cust_id IN
(SELECT DISTINCT cust_id 
FROM transactions
WHERE cust_id IS NOT NULL);

ALTER TABLE transactions
ADD COLUMN order_date date;

UPDATE transactions
SET order_date = "2025-04-01"
WHERE trans_id = 105;

SELECT * FROM transactions;

#GRUP BY: GROUP ALL ROWS HAVING SPECIFIC VALUE(BASED ON FUNCTIONS SUCH AS SUM, AVG, MAX, ETC) 
SELECT MAX(rate) AS max, order_date
FROM transactions
GROUP BY order_date;

#HAVING: USED IN PLACE OF WHERE WHEN DEALING WITH GROUP BY
SELECT MAX(rate) AS max, order_date
FROM transactions
GROUP BY order_date
HAVING max > 200;

#ROLLUP: EXTENSION OF GROUP BY, PRODUCES ANOTHER ROW AND GIVES GRAND TOTAL (TOTAL SUM, TOTAL COUNT)
SELECT SUM(rate) AS max, order_date
FROM transactions
GROUP BY order_date WITH ROLLUP
HAVING max > 200;

#ON DELETE SET NULL: ON DELETING FOREIGN KEY, ITS SET TO NULL
#ON DELETE CASCADE: ON DELETING FOREIGN KEY, ROW IS DELETED

SELECT * FROM transactions;
ALTER TABLE transactions
ADD CONSTRAINT fk_cust
FOREIGN KEY(cust_id) REFERENCES customers(cust_id)
ON DELETE SET NULL;

DELETE FROM customers
WHERE cust_id = 2;

#STORED PROCEDURE: STORES AN SQL QUERY AS A CUSTOM FUNCTION

DELIMITER $$
CREATE PROCEDURE staff_details()
BEGIN
    SELECT * FROM staff;
END $$
DELIMITER ;

CALL staff_details();

DROP PROCEDURE staff_details;

DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
	SELECT * FROM customers
    WHERE cust_id = id;
END$$
DELIMITER ;

CALL find_customer(3);

#TRIGGERS: auto executes some query based on INSERT, DELETE, UPDATE on a set on rules

SELECT * FROM staff;

ALTER TABLE staff
ADD COLUMN salary DECIMAL(10, 2) AFTER rate;

UPDATE staff
SET salary = rate * 2080;

CREATE TRIGGER upd
BEFORE UPDATE ON staff
FOR EACH ROW
SET NEW.salary = NEW.rate * 2080;

UPDATE staff
SET rate = 20 WHERE emp_id = 1;

CREATE TRIGGER before_sal_ins
 BEFORE INSERT ON staff
 FOR EACH ROW
 SET NEW.salary = NEW.rate * 2080; #use OLD to refer to old values
 
INSERT INTO staff (emp_id, f_name, l_name, phone_num, rate, eligibility, hire_date) 
VALUES(8, "HUFZA", "ANSARI", 342487372, 17.45, "YES", "2023-09-10");

 