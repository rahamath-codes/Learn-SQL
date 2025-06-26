/*
Triggers : A trigger is a special kind of stored program that automatically executes in response to certain events on a table.
These events can be ;
INSERT (before or after a row is inserted)
UPDATE (before or after a row is updated)
DELETE (before or after a row is deleted)

| Feature          | BEFORE Trigger                        | AFTER Trigger                        |
| ---------------- | ------------------------------------- | ------------------------------------ |
| When it runs     | Before saving data (before action)    | After data is saved (after action)   |
| Can stop action? | Yes, can block insert/update/delete   | No, action already done              |
| Can change data? | Yes, can modify data before saving    | No, data already saved               |
| Used for         | Checking or fixing data before saving | Logging, sending alerts after action |
| Example          | Block insert if age is less than 18   | Add a log entry after insert         |

Basic Syntax :
DELIMITER //
CREATE TRIGGER trigger_name
BEFORE|AFTER INSERT|UPDATE|DELETE ON table_name
FOR EACH ROW
BEGIN
    -- trigger logic here
END;
//
DELIMITER ;
*/

-- ✅ Step 1: Create new database called 'triggers'
CREATE DATABASE IF NOT EXISTS triggers_Db;

-- ✅ Step 2: Use the database
USE triggers_DB;

-- ✅ Step 3: Create main table - employees
-- CREATE TABLE employees (
--     emp_id INT AUTO_INCREMENT PRIMARY KEY,
--     emp_name VARCHAR(50),
--     age INT
-- );

/*==================================Before Trigger============================================*/
DELIMITER //

CREATE TRIGGER trg_before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Check if the new age is less than 18
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '45000' -- Raise an error to block insert
        SET MESSAGE_TEXT = 'Employee must be at least 18 years old';
    END IF;
END;
//

DELIMITER ;

-- This insert should work (age >= 18)
INSERT INTO employees (emp_name, age) VALUES ('Siva', 20);

-- This insert should fail with error (age < 18)
INSERT INTO employees (emp_name, age) VALUES ('Kumar', 16);


/*==================================After Trigger============================================*/
-- ✅ Step 4: Create log table to store trigger actions
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(10),       -- INSERT / UPDATE / DELETE
    emp_name_snapshot VARCHAR(50), -- Name snapshot at that moment
    action_time DATETIME
);

-- ✅ Step 5: Create AFTER INSERT trigger
DELIMITER //

CREATE TRIGGER trg_after_insert_employee
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (emp_id, action_type, emp_name_snapshot, action_time)
    VALUES (NEW.emp_id, 'INSERT', NEW.emp_name, NOW());
END;
//

-- ✅ Step 6: Create AFTER UPDATE trigger
CREATE TRIGGER trg_after_update_employee
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (emp_id, action_type, emp_name_snapshot, action_time)
    VALUES (NEW.emp_id, 'UPDATE', NEW.emp_name, NOW());
END;
//

-- ✅ Step 7: Create AFTER DELETE trigger
CREATE TRIGGER trg_after_delete_employee
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (emp_id, action_type, emp_name_snapshot, action_time)
    VALUES (OLD.emp_id, 'DELETE', OLD.emp_name, NOW());
END;
//

DELIMITER ;

-- ✅ Step 8: Testing

-- 🔄 Insert an employee
INSERT INTO employees (emp_name, age) VALUES ('Kavin', 22);

-- ✏️ Update employee name
UPDATE employees SET emp_name = 'Kavin Kumar' WHERE emp_id = 1;

-- ❌ Delete employee
DELETE FROM employees WHERE emp_id = 1;

-- 📄 View log entries
SELECT * FROM employee_log;
