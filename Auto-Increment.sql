/*
AUTO_INCREMENT is a column attribute in SQL that automatically generates a unique, sequential numeric value whenever a new record is inserted into a table. 
It is commonly used for primary key columns to ensure each row has a unique identifier without manually specifying it.
*/


-- Create employees table with auto-increment primary key
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,  -- emp_id will auto-generate unique numbers
    emp_name VARCHAR(50),
    age INT
);

-- Insert employee records without specifying emp_id
INSERT INTO employees (emp_name, age) VALUES ('Siva', 25);
INSERT INTO employees (emp_name, age) VALUES ('Kumar', 30);

-- Select all employees to see the auto-generated emp_id values
SELECT * FROM employees;
