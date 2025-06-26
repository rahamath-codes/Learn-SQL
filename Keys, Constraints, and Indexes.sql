/*
Keys, Constraints, and Indexes: 
Keys: Uniquely identify rows (Primary Key) or link tables (Foreign Key).
Constraints: Rules applied to table columns to enforce data integrity.
Indexes: Data structures that improve the speed of data retrieval.
*/

-- Create a departments table (referenced by foreign key)
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_id)
);

-- Create employees table with keys and constraints
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    dept_id INT,
    age INT,
    PRIMARY KEY (emp_id),
    UNIQUE (email),
    CHECK (age >= 18),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert sample data into departments
INSERT INTO departments (dept_name) VALUES ('HR'), ('IT'), ('Sales');

-- Insert sample data into employees
INSERT INTO employees (emp_name, email, dept_id, age) VALUES
('Alice', 'alice@example.com', 1, 30),
('Bob', 'bob@example.com', 2, 25);

-- Create an index on emp_name to speed up search
CREATE INDEX idx_emp_name ON employees(emp_name);

-- Alter table to add a UNIQUE constraint on a new column
ALTER TABLE employees ADD COLUMN phone VARCHAR(15);
ALTER TABLE employees ADD CONSTRAINT uq_phone UNIQUE (phone);

-- Alter table to add a foreign key (example: manager_id references employees)
ALTER TABLE employees ADD COLUMN manager_id INT;
ALTER TABLE employees ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees(emp_id);

-- Drop the index
DROP INDEX idx_emp_name ON employees;

-- Drop foreign key constraint
ALTER TABLE employees DROP FOREIGN KEY fk_manager;

-- Drop unique constraint
ALTER TABLE employees DROP INDEX uq_phone;

-- Drop tables when done
DROP TABLE employees;
DROP TABLE departments;