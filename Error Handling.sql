/*
Error Handling - Error handling is how we catch and respond to errors 
(like duplicate keys, null values, or failed inserts) inside a stored procedure.

DECLARE HANDLER – to catch errors
SIGNAL – to raise custom errors
RESIGNAL – to rethrow errors (with custom message or original one)
 
| Step    | Syntax / Keyword                                               | What It Does                                                             |
| ------- | -------------------------------------------------------------- | ------------------------------------------------------------------------ |
| 1       | `DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ...`                | Tells SQL: "If **any error** happens, do this instead of crashing."      |
| 2       | `DECLARE EXIT HANDLER FOR NOT FOUND ...`                       | Tells SQL to **exit the procedure or loop** if no data is found.         |
| 3       | `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom message';` | Manually **raise an error** with a message (like throwing an exception). |
| 4       | `RESIGNAL;`                                                    | Re-raise the **original error**, used inside a handler.                  |
| 5       | `RESIGNAL SET MESSAGE_TEXT = 'Something went wrong';`          | Re-raise the error but with your **own message**.                        |
*/

-- Duplicate Handling

-- DELIMITER //
-- CREATE PROCEDURE addBranch(IN bid INT, IN bname VARCHAR(20), IN loc VARCHAR(20))
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR 1062
--     BEGIN
--         SELECT CONCAT('Duplicate ID ', bid, ' - Not inserted') AS error_msg;
--     END;

--     INSERT INTO branch VALUES (bid, bname, loc);
--     SELECT * FROM branch;
-- END;
-- //
-- DELIMITER ;
-- CALL addBranch(6, 'INFINE 5', 'MADURAI');
-- Signal - is used to throw an error manually inside your procedure.
-- DELIMITER //

-- CREATE PROCEDURE checkAge(IN age INT)
-- BEGIN
--     IF age < 18 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Underage - Not Allowed';
--     ELSE
--         SELECT 'Access Granted' AS status;
--     END IF;
-- END;
-- //
-- DELIMITER ;
-- CALL checkAge(16);


-- RESIGNAL is used inside an error handler to rethrow the error or give a custom message after catching it.
-- DELIMITER //
-- CREATE PROCEDURE testInsert()
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         RESIGNAL SET MESSAGE_TEXT = 'Something went wrong during insert';
--     END;

--     -- Trying to insert duplicate ID (e.g., 1 already exists)
--     INSERT INTO branch VALUES (1, 'DUPLICATE', 'LOC');
-- END;
-- //
-- DELIMITER ;
-- CALL testInsert();