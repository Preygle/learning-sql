# SQL Learning Guide

A comprehensive reference for SQL concepts and operations.

## Table of Contents
1. [Table Creation and Modification](#table-creation-and-modification)
2. [Basic CRUD Operations](#basic-crud-operations)
3. [Constraints](#constraints)
4. [Joins](#joins)
5. [Aggregate Functions](#aggregate-functions)
6. [Advanced Queries](#advanced-queries)
7. [Views and Indexes](#views-and-indexes)
8. [Stored Procedures](#stored-procedures)
9. [Triggers](#triggers)

---

## Table Creation and Modification

### Creating Tables
```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hourly_rate DECIMAL(5,2) NOT NULL,
    hire_date DATE,
    phone_number VARCHAR(15)
);
```

### Modifying Tables
```sql
-- Add a column
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

-- Modify column data type
ALTER TABLE employees
MODIFY COLUMN hourly_rate DECIMAL(6,2);

-- Rename column
ALTER TABLE employees
RENAME COLUMN phone_number TO contact_number;

-- Drop column
ALTER TABLE employees
DROP COLUMN email;
```

---

## Basic CRUD Operations

### Inserting Data
```sql
INSERT INTO employees (first_name, last_name, hourly_rate, hire_date, contact_number)
VALUES 
    ('Mohammad', 'Owais', 15.75, '2025-05-17', '7991503923'),
    ('Anjali', 'Verma', 20.50, '2025-05-16', '9812345678'),
    ('Rohan', 'Singh', 18.00, '2025-05-15', '9123456789');
```

### Querying Data
```sql
-- Basic select
SELECT * FROM employees;

-- Conditional select
SELECT first_name, last_name 
FROM employees 
WHERE hourly_rate > 18;

-- Select with pattern matching
SELECT * FROM employees
WHERE hire_date LIKE '2025-05-1_';
```

### Updating Data
```sql
UPDATE employees
SET hourly_rate = 22.00
WHERE emp_id = 1;
```

### Deleting Data
```sql
DELETE FROM employees
WHERE emp_id = 3;
```

---

## Constraints

### Primary Key
```sql
ALTER TABLE employees
ADD CONSTRAINT PRIMARY KEY(emp_id);
```

### Unique Constraint
```sql
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE(email);
```

### Check Constraint
```sql
ALTER TABLE employees
ADD CONSTRAINT min_rate CHECK(hourly_rate > 9);
```

### Foreign Key
```sql
CREATE TABLE transactions (
    trans_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
```

---

## Joins

### Inner Join
```sql
SELECT e.first_name, e.last_name, t.amount
FROM employees e
INNER JOIN transactions t ON e.emp_id = t.emp_id;
```

### Left Join
```sql
SELECT e.first_name, e.last_name, t.amount
FROM employees e
LEFT JOIN transactions t ON e.emp_id = t.emp_id;
```

### Self Join
```sql
SELECT e1.first_name, e1.last_name, 
       CONCAT(e2.first_name, ' ', e2.last_name) AS manager
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.emp_id;
```

---

## Aggregate Functions

```sql
-- Count
SELECT COUNT(*) AS total_employees FROM employees;

-- Max/Min
SELECT MAX(hourly_rate) AS highest_rate FROM employees;

-- Sum
SELECT SUM(amount) AS total_sales FROM transactions;

-- Average
SELECT AVG(hourly_rate) AS avg_rate FROM employees;

-- Group By
SELECT department, AVG(hourly_rate) AS avg_rate
FROM employees
GROUP BY department;
```

---

## Advanced Queries

### Subqueries
```sql
SELECT first_name, last_name
FROM employees
WHERE hourly_rate > (SELECT AVG(hourly_rate) FROM employees);
```

### Unions
```sql
SELECT first_name, last_name FROM employees
UNION
SELECT customer_name, '' FROM customers;
```

### Transactions
```sql
START TRANSACTION;
INSERT INTO employees (...) VALUES (...);
UPDATE transactions SET ... WHERE ...;
COMMIT;
-- or ROLLBACK if needed
```

---

## Views and Indexes

### Creating Views
```sql
CREATE VIEW employee_names AS
SELECT first_name, last_name FROM employees;
```

### Using Indexes
```sql
CREATE INDEX idx_last_name ON employees(last_name);
```

---

## Stored Procedures

```sql
DELIMITER $$
CREATE PROCEDURE get_employee(IN emp_id INT)
BEGIN
    SELECT * FROM employees WHERE emp_id = emp_id;
END $$
DELIMITER ;

-- Call procedure
CALL get_employee(1);
```

---

## Triggers

```sql
DELIMITER $$
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.salary = NEW.hourly_rate * 2080;
END $$
DELIMITER ;
```

---

## Best Practices
1. Always use proper data types
2. Normalize your database structure
3. Use transactions for multiple related operations
4. Create indexes on frequently queried columns
5. Use constraints to maintain data integrity
6. Document your database schema
