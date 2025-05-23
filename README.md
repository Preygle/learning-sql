Okay, here is a comprehensive SQL learning journey documented in a single Markdown file. I've structured it for readability, corrected and clarified concepts, and refined the examples, including table structures and data, to make them clear and illustrative for your future reference.

# My SQL Learning Journey: A Comprehensive Guide

Welcome to my personal SQL (Structured Query Language) reference guide! This document chronicles my exploration of SQL, covering fundamental concepts to more advanced topics. It's designed to be a clear, easy-to-read resource for future review and practice.

## Table of Contents

1.  [Introduction to SQL](#1-introduction-to-sql)
2.  [Database & Server Operations](#2-database--server-operations)
3.  [Data Definition Language (DDL)](#3-data-definition-language-ddl)
    *   [Creating Tables (`CREATE TABLE`)](#creating-tables-create-table)
    *   [Modifying Tables (`ALTER TABLE`)](#modifying-tables-alter-table)
    *   [Renaming Tables (`RENAME TABLE`)](#renaming-tables-rename-table)
    *   [Deleting Tables (`DROP TABLE`)](#deleting-tables-drop-table)
4.  [Constraints](#4-constraints)
    *   [NOT NULL](#not-null)
    *   [UNIQUE](#unique)
    *   [PRIMARY KEY](#primary-key)
    *   [AUTO_INCREMENT](#auto_increment)
    *   [FOREIGN KEY](#foreign-key)
        *   [`ON DELETE SET NULL`](#on-delete-set-null)
        *   [`ON DELETE CASCADE`](#on-delete-cascade)
    *   [CHECK](#check)
    *   [DEFAULT](#default)
5.  [Data Manipulation Language (DML)](#5-data-manipulation-language-dml)
    *   [Inserting Data (`INSERT INTO`)](#inserting-data-insert-into)
    *   [Updating Data (`UPDATE`)](#updating-data-update)
    *   [Deleting Data (`DELETE FROM`)](#deleting-data-delete-from)
6.  [Data Query Language (DQL) - Basic Queries](#6-data-query-language-dql---basic-queries)
    *   [Selecting All Columns (`SELECT *`)](#selecting-all-columns-select-)
    *   [Selecting Specific Columns](#selecting-specific-columns)
    *   [Filtering Data (`WHERE`)](#filtering-data-where)
        *   [Comparison Operators](#comparison-operators)
        *   [Logical Operators (`AND`, `OR`, `NOT`)](#logical-operators-and-or-not)
        *   [Checking for NULL (`IS NULL`, `IS NOT NULL`)](#checking-for-null-is-null-is-not-null)
        *   [`BETWEEN` Operator](#between-operator)
        *   [`IN` Operator](#in-operator)
7.  [DQL - Advanced Filtering & Sorting](#7-dql---advanced-filtering--sorting)
    *   [Pattern Matching (`LIKE`)](#pattern-matching-like)
    *   [Ordering Results (`ORDER BY`)](#ordering-results-order-by)
    *   [Limiting Results (`LIMIT`)](#limiting-results-limit)
8.  [Aggregate Functions](#8-aggregate-functions)
9.  [String Functions](#9-string-functions)
    *   [`CONCAT`](#concat)
10. [Joining Tables](#10-joining-tables)
    *   [`INNER JOIN`](#inner-join)
    *   [`LEFT JOIN` (or `LEFT OUTER JOIN`)](#left-join-or-left-outer-join)
    *   [`RIGHT JOIN` (or `RIGHT OUTER JOIN`)](#right-join-or-right-outer-join)
    *   [`SELF JOIN`](#self-join)
11. [Set Operations](#11-set-operations)
    *   [`UNION`](#union)
    *   [`UNION ALL`](#union-all)
12. [Grouping Data](#12-grouping-data)
    *   [`GROUP BY`](#group-by)
    *   [`HAVING`](#having)
    *   [`WITH ROLLUP` (MySQL Specific)](#with-rollup-mysql-specific)
13. [Transaction Control Language (TCL)](#13-transaction-control-language-tcl)
    *   [`COMMIT`](#commit)
    *   [`ROLLBACK`](#rollback)
    *   [`SET AUTOCOMMIT`](#set-autocommit)
14. [Views](#14-views)
    *   [Creating Views (`CREATE VIEW`)](#creating-views-create-view)
    *   [Querying Views](#querying-views)
    *   [Dropping Views (`DROP VIEW`)](#dropping-views-drop-view)
15. [Indexes](#15-indexes)
    *   [Showing Indexes](#showing-indexes)
    *   [Creating Indexes (`CREATE INDEX`)](#creating-indexes-create-index)
    *   [Dropping Indexes (`DROP INDEX`)](#dropping-indexes-drop-index)
16. [Subqueries (Nested Queries)](#16-subqueries-nested-queries)
17. [Stored Procedures](#17-stored-procedures)
    *   [Creating Procedures](#creating-procedures)
    *   [Calling Procedures](#calling-procedures)
    *   [Procedures with Parameters](#procedures-with-parameters)
    *   [Dropping Procedures](#dropping-procedures)
18. [Triggers](#18-triggers)
    *   [Creating Triggers](#creating-triggers)
    *   [Viewing Triggers](#viewing-triggers)
    *   [Dropping Triggers](#dropping-triggers)

---

## 1. Introduction to SQL

SQL, or Structured Query Language, is a standard language for managing and manipulating relational databases. It allows you to perform tasks such as querying data, inserting, updating, and deleting records, creating and modifying database schemas, and controlling access to data.

---

## 2. Database & Server Operations

These commands help manage the database environment.

```sql
-- Select the database to use for subsequent commands
USE my_database; -- Replace 'my_database' with your database name

-- Show server variables, e.g., the data directory path (MySQL specific)
SHOW VARIABLES LIKE 'datadir';

3. Data Definition Language (DDL)

DDL statements are used to define, modify, and delete database structures (like tables).

Creating Tables (CREATE TABLE)

This command creates a new table in the database.

Example: Employees Table
Let's create an Employees table which will be used in many examples.

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each employee, automatically increments
    first_name VARCHAR(50) NOT NULL,        -- Employee's first name, cannot be null
    last_name VARCHAR(50) NOT NULL,         -- Employee's last name, cannot be null
    email VARCHAR(100) UNIQUE,              -- Employee's email, must be unique
    phone_number VARCHAR(20),               -- Employee's phone number
    hire_date DATE,                         -- Date when the employee was hired
    job_title VARCHAR(50),                  -- Employee's job title
    salary DECIMAL(10, 2),                  -- Employee's salary (e.g., 99999999.99)
    department_id INT                       -- Foreign key to a Departments table (to be created later)
);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Example: Departments Table

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE
);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Example: Customers and Orders Tables (for Foreign Key examples)

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2),
    customer_id INT -- This will be a foreign key
);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Modifying Tables (ALTER TABLE)

This command is used to add, delete, or modify columns in an existing table, or to add/drop constraints.

Add a Column:

ALTER TABLE Employees
ADD COLUMN bonus DECIMAL(7, 2) DEFAULT 0.00; -- Adds a 'bonus' column with a default value
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Add a Column at a Specific Position:

ALTER TABLE Employees
ADD COLUMN middle_name VARCHAR(50) AFTER first_name; -- Adds 'middle_name' after 'first_name'
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Modify Column Data Type/Properties:

ALTER TABLE Employees
MODIFY COLUMN phone_number VARCHAR(15); -- Changes the max length of phone_number

ALTER TABLE Employees
MODIFY COLUMN salary DECIMAL(11, 2) NOT NULL; -- Change precision and add NOT NULL
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Rename a Column:

-- (Syntax varies by RDBMS. MySQL example)
ALTER TABLE Employees
RENAME COLUMN job_title TO position_title;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Drop a Column:

ALTER TABLE Employees
DROP COLUMN middle_name;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Renaming Tables (RENAME TABLE)
RENAME TABLE Employees TO Staff_Members;
RENAME TABLE Staff_Members TO Employees; -- Renaming it back for consistency
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Deleting Tables (DROP TABLE)

This command completely removes a table and its data. Use with caution!

-- DROP TABLE Employees;
-- DROP TABLE Departments;
-- DROP TABLE Customers;
-- DROP TABLE Orders;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
4. Constraints

Constraints are rules enforced on data columns in a table to ensure data accuracy and integrity.

NOT NULL

Ensures that a column cannot have a NULL value.

-- Defined during table creation (see Employees.first_name)
-- Or added/modified later:
ALTER TABLE Employees
MODIFY COLUMN hire_date DATE NOT NULL;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
UNIQUE

Ensures that all values in a column (or a set of columns) are different.

-- Defined during table creation (see Employees.email)
-- Or added later:
ALTER TABLE Departments
ADD CONSTRAINT uq_dept_name UNIQUE (department_name); -- Explicitly naming the constraint
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
PRIMARY KEY

Uniquely identifies each record in a table. A primary key must contain UNIQUE values and implicitly has a NOT NULL constraint. A table can have only one primary key.

-- Defined during table creation (see Employees.emp_id)
-- To add a primary key to an existing table (if one doesn't exist):
-- ALTER TABLE SomeTable ADD PRIMARY KEY (column_name);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
AUTO_INCREMENT

Allows a unique number to be generated automatically when a new record is inserted into a table. Typically used for primary key columns. (Syntax might be SERIAL or IDENTITY in other RDBMS).

-- Defined during table creation (see Employees.emp_id)
-- To set the starting value (MySQL):
-- ALTER TABLE Employees AUTO_INCREMENT = 100;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
FOREIGN KEY

A key used to link two tables together. It's a column (or a collection of columns) in one table that refers to the PRIMARY KEY in another table.

First, let's insert some data into Departments to reference.

INSERT INTO Departments (department_name) VALUES ('Human Resources'), ('Engineering'), ('Marketing'), ('Sales');
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Now, add a foreign key constraint to the Employees table:

ALTER TABLE Employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES Departments(department_id);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Foreign Key Actions (ON DELETE, ON UPDATE):

ON DELETE SET NULL

If a record in the parent table (the one referenced by the foreign key) is deleted, the corresponding foreign key values in the child table are set to NULL. The foreign key column in the child table must allow NULL values.

Example: If a customer is deleted, their orders' customer_id becomes NULL.

-- First, drop the existing FK if any, then add with ON DELETE SET NULL
-- ALTER TABLE Orders DROP FOREIGN KEY fk_orders_customer; -- (If named, find name via SHOW CREATE TABLE Orders)

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customer_set_null
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
ON DELETE SET NULL;

-- Let's add some data
INSERT INTO Customers (customer_name) VALUES ('Alice Smith'), ('Bob Johnson');
INSERT INTO Orders (order_date, amount, customer_id) VALUES
('2023-01-15', 100.50, 1), -- Alice's order
('2023-01-17', 75.00, 2);  -- Bob's order

-- Now, if Alice (customer_id=1) is deleted:
-- DELETE FROM Customers WHERE customer_id = 1;
-- SELECT * FROM Orders; -- Alice's order would now have customer_id = NULL
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
ON DELETE CASCADE

If a record in the parent table is deleted, all corresponding records in the child table are also deleted. Use with extreme caution!

Example: If a customer is deleted, all their orders are also deleted.

-- Assuming we dropped the previous FK on Orders
-- ALTER TABLE Orders DROP FOREIGN KEY fk_orders_customer_set_null;

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customer_cascade
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
ON DELETE CASCADE;

-- If Bob (customer_id=2) is deleted:
-- DELETE FROM Customers WHERE customer_id = 2;
-- SELECT * FROM Orders; -- Bob's order would be gone.
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Dropping a Foreign Key:
You need to know the constraint name (which might be system-generated if not explicitly named).

-- SHOW CREATE TABLE Employees; -- To find the constraint name for fk_department
ALTER TABLE Employees
DROP FOREIGN KEY fk_department; -- Use the actual name
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
CHECK

Ensures that values in a column (or columns) satisfy a specific condition.

ALTER TABLE Employees
ADD CONSTRAINT chk_salary CHECK (salary >= 30000); -- Salary must be at least 30000

-- Attempting to insert/update with salary < 30000 will fail.

-- To drop a check constraint:
ALTER TABLE Employees
DROP CONSTRAINT chk_salary; -- Or DROP CHECK chk_salary in some RDBMS
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
DEFAULT

Sets a default value for a column if no value is specified during an INSERT.

-- Defined during table creation (see Employees.bonus)
-- Or add a default to an existing column:
ALTER TABLE Employees
ALTER COLUMN hire_date SET DEFAULT (CURRENT_DATE);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
5. Data Manipulation Language (DML)

DML statements are used to manage data within tables.

Inserting Data (INSERT INTO)

Adds new rows (records) to a table.

-- Insert into Departments (already done, but for completeness)
-- INSERT INTO Departments (department_name) VALUES ('Human Resources'), ('Engineering'), ('Marketing'), ('Sales');
-- SELECT * FROM Departments; -- To get department_id values

-- Insert into Employees
INSERT INTO Employees (first_name, last_name, email, phone_number, hire_date, position_title, salary, department_id)
VALUES
('Alice', 'Wonderland', 'alice@example.com', '555-0101', '2022-08-15', 'Software Engineer', 75000.00, 2), -- Assuming Engineering is ID 2
('Bob', 'The Builder', 'bob@example.com', '555-0102', '2021-05-20', 'Project Manager', 90000.00, 2),
('Charlie', 'Brown', 'charlie@example.com', '555-0103', '2023-01-10', 'HR Specialist', 60000.00, 1), -- Assuming HR is ID 1
('Diana', 'Prince', 'diana@example.com', NULL, '2022-11-01', 'Marketing Lead', 80000.00, 3); -- Assuming Marketing is ID 3

-- Inserting with fewer columns (others get default or NULL if allowed)
INSERT INTO Employees (first_name, last_name, email, position_title, salary, department_id)
VALUES ('Eve', 'Online', 'eve@example.com', 'Sales Associate', 55000.00, 4); -- hire_date will use its DEFAULT (CURRENT_DATE) if set

-- Check the inserted data
SELECT * FROM Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Updating Data (UPDATE)

Modifies existing records in a table. Always use a WHERE clause with UPDATE unless you intend to update all rows!

UPDATE Employees
SET salary = 80000.00, phone_number = '555-0104'
WHERE email = 'alice@example.com';

UPDATE Employees
SET salary = salary * 1.10 -- Give a 10% raise
WHERE department_id = 2; -- For everyone in Engineering
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Deleting Data (DELETE FROM)

Removes existing records from a table. Always use a WHERE clause with DELETE unless you intend to delete all rows!

-- Let's add an employee to delete
INSERT INTO Employees (first_name, last_name, email, position_title, salary, department_id)
VALUES ('Temp', 'User', 'temp@example.com', 'Intern', 35000.00, 1);

DELETE FROM Employees
WHERE email = 'temp@example.com';

-- To delete all rows from a table (use with extreme caution!):
-- DELETE FROM Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
6. Data Query Language (DQL) - Basic Queries

DQL is used to retrieve data from the database. The primary command is SELECT.

Selecting All Columns (SELECT *)
SELECT * FROM Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Selecting Specific Columns
SELECT first_name, last_name, email FROM Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Filtering Data (WHERE)

The WHERE clause is used to filter records based on specified conditions.

Comparison Operators

=, != (or <>), >, <, >=, <=

SELECT first_name, last_name, salary
FROM Employees
WHERE salary > 70000;

SELECT *
FROM Employees
WHERE position_title = 'Project Manager';
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Logical Operators (AND, OR, NOT)
SELECT first_name, last_name, position_title, salary
FROM Employees
WHERE position_title = 'Software Engineer' AND salary > 70000;

SELECT first_name, last_name, department_id
FROM Employees
WHERE department_id = 1 OR department_id = 3; -- Employees in HR or Marketing
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Checking for NULL (IS NULL, IS NOT NULL)
SELECT first_name, last_name, phone_number
FROM Employees
WHERE phone_number IS NULL;

SELECT first_name, last_name, phone_number
FROM Employees
WHERE phone_number IS NOT NULL;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
BETWEEN Operator

Selects values within a given range (inclusive).

SELECT first_name, last_name, salary
FROM Employees
WHERE salary BETWEEN 60000 AND 80000;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
IN Operator

Allows you to specify multiple values in a WHERE clause.

SELECT first_name, last_name, position_title
FROM Employees
WHERE position_title IN ('Software Engineer', 'HR Specialist', 'Sales Associate');
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
7. DQL - Advanced Filtering & Sorting
Pattern Matching (LIKE)

Used with WHERE to search for a specified pattern in a column.

%: Represents zero, one, or multiple characters.

_: Represents a single character.

-- Employees whose first name starts with 'A'
SELECT first_name, last_name FROM Employees
WHERE first_name LIKE 'A%';

-- Employees whose last name ends with 'son'
SELECT first_name, last_name FROM Employees
WHERE last_name LIKE '%son'; -- Bob Johnson (if we added him)

-- Employees whose email contains 'example'
SELECT email FROM Employees
WHERE email LIKE '%example%';

-- Employees whose first name has 'o' as the second letter
SELECT first_name, last_name FROM Employees
WHERE first_name LIKE '_o%'; -- Bob
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Ordering Results (ORDER BY)

Sorts the result set in ascending (ASC) or descending (DESC) order.

-- Order by salary, highest first
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC;

-- Order by department_id (ascending), then by salary (descending) within each department
SELECT first_name, last_name, department_id, salary
FROM Employees
ORDER BY department_id ASC, salary DESC; -- ASC is default if not specified
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Limiting Results (LIMIT)

Restricts the number of rows returned. (Syntax can vary, TOP in SQL Server, ROWNUM in Oracle).

-- Get the top 3 highest-paid employees
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;

-- Get the 2nd highest-paid employee (skip 1, take 1)
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 1, 1; -- LIMIT offset, count
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
8. Aggregate Functions

Perform calculations on a set of values and return a single summary value. Usually used with GROUP BY.

-- Count the total number of employees
SELECT COUNT(*) AS total_employees FROM Employees;

-- Count employees with a phone number
SELECT COUNT(phone_number) AS employees_with_phone FROM Employees;

-- Calculate the sum of all salaries
SELECT SUM(salary) AS total_payroll FROM Employees;

-- Find the average salary
SELECT AVG(salary) AS average_salary FROM Employees;

-- Find the maximum salary
SELECT MAX(salary) AS highest_salary FROM Employees;

-- Find the minimum salary
SELECT MIN(salary) AS lowest_salary FROM Employees;

-- Average salary for 'Software Engineer'
SELECT AVG(salary) AS avg_SE_salary
FROM Employees
WHERE position_title = 'Software Engineer';
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
9. String Functions
CONCAT

Concatenates (joins) two or more strings.

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    position_title
FROM Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
10. Joining Tables

Joins are used to combine rows from two or more tables based on a related column between them.

Let's ensure our Employees table has department_id values that match Departments.
(Our earlier INSERT statements for Employees should have handled this).

INNER JOIN

Returns records that have matching values in both tables.

SELECT
    e.first_name,
    e.last_name,
    e.position_title,
    d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
LEFT JOIN (or LEFT OUTER JOIN)

Returns all records from the left table (Employees), and the matched records from the right table (Departments). The result is NULL from the right side if there is no match.

-- Let's add an employee without a department to illustrate
INSERT INTO Employees (first_name, last_name, email, position_title, salary, department_id)
VALUES ('NoDept', 'User', 'nodept@example.com', 'Consultant', 70000.00, NULL);

SELECT
    e.first_name,
    e.last_name,
    e.position_title,
    d.department_name
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;
-- 'NoDept User' will appear, but with NULL for department_name.
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
RIGHT JOIN (or RIGHT OUTER JOIN)

Returns all records from the right table (Departments), and the matched records from the left table (Employees). The result is NULL from the left side if there is no match.

-- Let's add a department with no employees to illustrate
INSERT INTO Departments (department_name) VALUES ('Research');

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM Employees e
RIGHT JOIN Departments d ON e.department_id = d.department_id;
-- 'Research' department will appear, with NULL for employee names.
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
SELF JOIN

Joins a table to itself. This is useful for querying hierarchical data or comparing rows within the same table. Requires table aliases.

Example: Employee and their Manager
First, let's create a suitable table and data.

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Staff(staff_id) -- Self-referencing FK
);

INSERT INTO Staff (staff_id, name, manager_id) VALUES
(1, 'CEO', NULL),
(2, 'CTO', 1),
(3, 'Lead Engineer', 2),
(4, 'Software Engineer A', 3),
(5, 'Software Engineer B', 3),
(6, 'Marketing Director', 1),
(7, 'Marketing Specialist', 6);

-- Query to show each employee and their manager's name
SELECT
    employee.name AS employee_name,
    manager.name AS manager_name
FROM Staff employee
LEFT JOIN Staff manager ON employee.manager_id = manager.staff_id;
-- Using LEFT JOIN to include the CEO who has no manager
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
11. Set Operations

Combine the result-sets of two or more SELECT statements.

UNION

Combines results and removes duplicate rows. The SELECT statements must have the same number of columns, and columns must have compatible data types.

-- Example: Get a list of all first names from Employees and distinct customer names
CREATE TABLE Contacts (name VARCHAR(100), type VARCHAR(20));
INSERT INTO Contacts (name, type) SELECT first_name, 'Employee' FROM Employees;
INSERT INTO Contacts (name, type) SELECT customer_name, 'Customer' FROM Customers; -- Assuming Customers table exists

SELECT name FROM Employees -- Selects first_name
UNION
SELECT customer_name FROM Customers; -- Selects customer_name
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

A more practical example might be unioning data from two tables with similar structures, e.g., ActiveEmployees and ArchivedEmployees.

UNION ALL

Combines results but includes all duplicate rows.

SELECT first_name FROM Employees
WHERE department_id = 2 -- Engineering
UNION ALL
SELECT first_name FROM Employees
WHERE salary > 80000; -- High earners (could include engineers already listed)
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
12. Grouping Data
GROUP BY

Groups rows that have the same values in specified columns into summary rows. Often used with aggregate functions.

-- Count of employees in each department
SELECT
    d.department_name,
    COUNT(e.emp_id) AS number_of_employees
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Average salary per position title
SELECT
    position_title,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY position_title;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
HAVING

Filters groups created by GROUP BY. WHERE filters rows before grouping; HAVING filters groups after grouping.

-- Departments with more than 1 employee
SELECT
    d.department_name,
    COUNT(e.emp_id) AS number_of_employees
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.emp_id) > 1;

-- Position titles where the average salary is greater than 70000
SELECT
    position_title,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY position_title
HAVING AVG(salary) > 70000;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
WITH ROLLUP (MySQL Specific)

An extension of GROUP BY that produces subtotal and grand total rows for the aggregates.

-- Total salary per department, and a grand total for all departments
SELECT
    d.department_name,
    SUM(e.salary) AS total_salary_in_dept
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name WITH ROLLUP;
-- The last row (where department_name is NULL) shows the grand total salary.
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
13. Transaction Control Language (TCL)

Manage changes made by DML statements. Transactions ensure atomicity (all or nothing).

COMMIT

Saves all changes made in the current transaction to the database permanently.

ROLLBACK

Undoes all changes made in the current transaction since the last COMMIT or START TRANSACTION.

SET AUTOCOMMIT

Controls whether DML statements are automatically committed.

SET AUTOCOMMIT = ON; (Default in many RDBMS): Each SQL statement is a transaction and is committed immediately.

SET AUTOCOMMIT = OFF;: Statements are not committed until an explicit COMMIT is issued.

SET AUTOCOMMIT = OFF;

-- START TRANSACTION; -- Optionally explicit start

INSERT INTO Employees (first_name, last_name, email, position_title, salary, department_id)
VALUES ('Transaction', 'Test', 'trans@example.com', 'Tester', 50000.00, 1);

UPDATE Employees SET salary = 52000 WHERE email = 'trans@example.com';

-- At this point, changes are not permanent yet.

-- To save changes:
-- COMMIT;

-- To undo changes (if COMMIT hasn't been run):
ROLLBACK;

SET AUTOCOMMIT = ON; -- Restore default behavior

-- Verify if rollback worked (Transaction Test employee should not exist or not have updated salary)
SELECT * FROM Employees WHERE email = 'trans@example.com';
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
14. Views

A view is a virtual table based on the result-set of an SQL statement. It stores a query and can be queried like a table.

Creating Views (CREATE VIEW)
CREATE VIEW Engineering_Team AS
SELECT emp_id, first_name, last_name, email, position_title, salary
FROM Employees
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering');
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Querying Views
SELECT * FROM Engineering_Team;

SELECT first_name, salary FROM Engineering_Team WHERE salary > 80000;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Changes to the underlying Employees table data are reflected in the Engineering_Team view.

Dropping Views (DROP VIEW)
DROP VIEW Engineering_Team;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
15. Indexes

Indexes are special lookup tables that the database search engine can use to speed up data retrieval. They are used to find rows with specific column values quickly.

Showing Indexes
SHOW INDEXES FROM Employees; -- MySQL specific
-- Other RDBMS have different ways to list indexes (e.g., system catalog queries).
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Creating Indexes (CREATE INDEX)
-- Create an index on the last_name column
CREATE INDEX idx_lastname ON Employees(last_name);

-- Create a composite (multi-column) index
CREATE INDEX idx_dept_salary ON Employees(department_id, salary);
-- Useful for queries filtering/sorting on department_id then salary.
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

While indexes speed up SELECT queries, they can slow down INSERT, UPDATE, and DELETE operations because the index also needs to be updated.

Dropping Indexes (DROP INDEX)
ALTER TABLE Employees
DROP INDEX idx_lastname; -- MySQL syntax

-- Or for some RDBMS:
-- DROP INDEX idx_dept_salary ON Employees;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
16. Subqueries (Nested Queries)

A subquery is a query nested inside another SQL query (e.g., within SELECT, INSERT, UPDATE, DELETE, FROM, or WHERE).

-- Employees whose salary is above the average salary of all employees
SELECT first_name, last_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- Find employees who are in the 'Marketing' department using a subquery
SELECT first_name, last_name
FROM Employees
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Marketing');

-- Subquery in SELECT (Correlated Subquery): Show employee name and their department's name
SELECT
    e.first_name,
    e.last_name,
    (SELECT d.department_name FROM Departments d WHERE d.department_id = e.department_id) AS department_name
FROM Employees e;

-- Subquery with IN: Find customers who have placed orders
SELECT customer_name
FROM Customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM Orders WHERE customer_id IS NOT NULL);
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
17. Stored Procedures

A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

DELIMITER changes are often needed because procedures contain semicolons.

Creating Procedures
DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM Employees;
END$$

DELIMITER ;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Calling Procedures
CALL GetAllEmployees();
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Procedures with Parameters

IN: Input parameter. OUT: Output parameter. INOUT: Both.

DELIMITER $$

CREATE PROCEDURE GetEmployeeById(IN empId INT)
BEGIN
    SELECT * FROM Employees WHERE emp_id = empId;
END$$

DELIMITER ;

CALL GetEmployeeById(1); -- Call with Alice's emp_id (assuming it's 1)
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN deptName VARCHAR(50))
BEGIN
    SELECT e.*
    FROM Employees e
    JOIN Departments d ON e.department_id = d.department_id
    WHERE d.department_name = deptName;
END$$

DELIMITER ;

CALL GetEmployeesByDepartment('Engineering');
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Dropping Procedures
DROP PROCEDURE GetAllEmployees;
DROP PROCEDURE GetEmployeeById;
DROP PROCEDURE GetEmployeesByDepartment;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
18. Triggers

A database trigger is a stored procedure that automatically executes when a specific event (INSERT, UPDATE, DELETE) occurs on a specified table.

Example: Maintain an audit log or a derived column.

Let's add a last_salary_update column to Employees.

ALTER TABLE Employees ADD COLUMN last_salary_update TIMESTAMP;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Creating Triggers

Trigger to update last_salary_update when salary changes.
NEW refers to the row being inserted or the new version of the row being updated.
OLD refers to the old version of the row being updated or deleted.

DELIMITER $$

CREATE TRIGGER before_employee_salary_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary <> OLD.salary THEN  -- Only update if salary actually changed
        SET NEW.last_salary_update = NOW();
    END IF;
END$$

DELIMITER ;

-- Test the trigger
UPDATE Employees SET salary = salary + 1000 WHERE email = 'alice@example.com';
SELECT emp_id, first_name, salary, last_salary_update FROM Employees WHERE email = 'alice@example.com';
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

Trigger to set hire_date if not provided during insert (alternative to DEFAULT).

DELIMITER $$

CREATE TRIGGER before_employee_insert_set_hire_date
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.hire_date IS NULL THEN
        SET NEW.hire_date = CURRENT_DATE();
    END IF;
    -- Example: Auto-calculate a 'full_name' column if it existed
    -- SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);
END$$

DELIMITER ;

-- Test: Insert an employee without hire_date
-- INSERT INTO Employees (first_name, last_name, email, position_title, salary, department_id)
-- VALUES ('Trigger', 'Test', 'trigger@example.com', 'Specialist', 60000.00, 1);
-- SELECT * FROM Employees WHERE email = 'trigger@example.com'; -- Check hire_date
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Viewing Triggers (MySQL)
SHOW TRIGGERS;
-- SHOW TRIGGERS LIKE 'Employees%';
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END
Dropping Triggers
DROP TRIGGER before_employee_salary_update;
DROP TRIGGER before_employee_insert_set_hire_date;
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
SQL
IGNORE_WHEN_COPYING_END

This concludes my SQL learning journey documentation. I hope this serves as a valuable reference!

IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
IGNORE_WHEN_COPYING_END