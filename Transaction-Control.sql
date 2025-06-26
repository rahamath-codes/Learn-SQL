/*
TRANSACTION : A transaction is a sequence of one or more SQL operations executed as a single unit of work. 
It ensures data integrity by making sure either all operations succeed (COMMIT) or none do (ROLLBACK).
*/

-- Create a sample table for demonstration
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO accounts VALUES (1, 500.00), (2, 300.00);

-- 1. START TRANSACTION or BEGIN
START TRANSACTION;

-- Transfer 100 from account 1 to account 2
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

-- 2. SAVEPOINT: set a point to rollback to if needed
SAVEPOINT midway;

-- Imagine an error or condition check here (simulate with a variable or condition in real use)

-- 3. If everything is fine, COMMIT changes permanently
COMMIT;

-- -- OR -- to rollback all changes after START TRANSACTION
-- ROLLBACK;

-- Example with SAVEPOINT rollback
START TRANSACTION;

UPDATE accounts SET balance = balance - 50 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 50 WHERE account_id = 2;

-- Create a savepoint here
SAVEPOINT before_error;

-- Some error happens, rollback only to savepoint (partial rollback)
ROLLBACK TO SAVEPOINT before_error;

-- Commit the rest
COMMIT;

-- Clean up: drop table after demo
DROP TABLE accounts;
