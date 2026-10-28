-- ============================================
-- Project: Employee Health Center Database
-- Tool   : MySQL
-- Topics : CREATE, INSERT, SELECT, WHERE, AND, OR, IN, ORDER BY
-- ============================================

-- Setup (safe to run many times)
DROP DATABASE IF EXISTS health_center;
CREATE DATABASE health_center;
USE health_center;

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department    VARCHAR(100),
    age           INT
);

INSERT INTO employees (employee_name, department, age)
VALUES
('Rahul',  'HR',           26),
('Shreya', 'Finance',      29),
('Rishav', 'Security',     32),
('Wakib',  'Housekeeping', 35),
('Girish', 'Admin',        30),
('Sujith', 'Operations',   26),
('Emmi',   'Supervisor',   35);

-- Check that the data loaded (expect 7 rows)
SELECT * FROM employees;

-- 1. Show only Operations employees (expect: Sujith)
SELECT * FROM employees
WHERE department = 'Operations';

-- 2. Show employees older than 30 (expect: Rishav, Wakib, Emmi)
SELECT employee_name, age FROM employees
WHERE age > 30;

-- 3. Combine two conditions with AND (expect: 0 rows, Sujith is 26)
SELECT * FROM employees
WHERE department = 'Operations' AND age > 30;

-- 4. Show only Girish (expect: Girish)
SELECT employee_name, department FROM employees
WHERE employee_name = 'Girish';

-- 5. Show employees in Operations OR Admin (expect: Girish, Sujith)
SELECT employee_name, department FROM employees
WHERE department = 'Operations' OR department = 'Admin';

-- 6. Sort by age, highest first
SELECT employee_name, age FROM employees
ORDER BY age DESC;

-- 7. Show employees from the Security department (expect: Rishav)
SELECT employee_name, department FROM employees
WHERE department = 'Security';

-- 8. Show employees younger than 30 (expect: Rahul, Shreya, Sujith)
SELECT employee_name, age FROM employees
WHERE age < 30;

-- 9. Employees in Operations or Admin using IN, sorted by name
SELECT employee_name, department FROM employees
WHERE department IN ('Operations', 'Admin')
ORDER BY employee_name;

-- 10. All employees sorted by age, lowest first
SELECT employee_name, age FROM employees
ORDER BY age ASC;