/*
Data Definition Language : DCL (Data Control Language) is used to control access to data in a database. 
It deals with permissions and privileges — basically who can do what.
*/

-- 1. Create a new database and use it
CREATE DATABASE secure_db;
USE secure_db;

-- 2. Create a sample table
CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content TEXT
);

-- 3. Create a new user with username 'john' and password 'john123'
CREATE USER 'john'@'localhost' IDENTIFIED BY 'john123';

-- 4. Grant SELECT, INSERT, and UPDATE privileges on the notes table to 'john'
GRANT SELECT, INSERT, UPDATE ON secure_db.notes TO 'john'@'localhost';

-- 5. Optional: View the current privileges granted to 'john'
SHOW GRANTS FOR 'john'@'localhost';

-- 6. Revoke only the INSERT privilege
REVOKE INSERT ON secure_db.notes FROM 'john'@'localhost';

-- 7. Optional: Recheck privileges after revoking
SHOW GRANTS FOR 'john'@'localhost';

-- 8. Optional: Revoke all privileges
-- REVOKE ALL PRIVILEGES ON secure_db.* FROM 'john'@'localhost';

-- 9. Drop the user (cleanup)
-- DROP USER 'john'@'localhost';

-- 10. Drop the database (optional cleanup)
-- DROP DATABASE secure_db;
