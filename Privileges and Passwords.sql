/*
MySQL Privileges and Passwords : Manage users and their access rights (privileges) in MySQL.
- Control who can do what on databases, tables, etc.
- Manage passwords for users.
*/

-- Create a new user 'john' with password 'John123!'
CREATE USER 'john'@'localhost' IDENTIFIED BY 'John123!';

-- Grant SELECT and INSERT privileges on database 'testdb'
GRANT SELECT, INSERT ON testdb.* TO 'john'@'localhost';

-- Show privileges of 'john'
SHOW GRANTS FOR 'john'@'localhost';

-- Revoke INSERT privilege from 'john'
REVOKE INSERT ON testdb.* FROM 'john'@'localhost';

-- Change password for 'john'
ALTER USER 'john'@'localhost' IDENTIFIED BY 'NewPass456!';

-- Drop the user 'john'
DROP USER 'john'@'localhost';
