/*Cursor - A cursor in SQL is a database object used to fetch rows one by one from a result set.
 Normally, a SELECT statement returns all rows at once, but sometimes you need to process 
each row individually that's when a cursor is used.
 1. DECLARE cursor ← Specify what data to fetch
 2. OPEN cursor ← Open the cursor
 3. FETCH cursor ← Fetch rows one by one
 4. LOOP ← Do something with each row
 5. CLOSE cursor ← Finish and close the cursor */
 
DELIMITER //

CREATE PROCEDURE greetEmployees()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE empName VARCHAR(100);
    
    DECLARE cur CURSOR FOR SELECT name FROM emp;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO empName;
        IF done THEN 
            LEAVE read_loop;
        END IF;

        SELECT CONCAT('Hello, ', empName) AS greeting;
    END LOOP;

    CLOSE cur;
END;
//

DELIMITER ;
CALL greetEmployees();

-- | Step    |  SQL Line                                              |  Meaning (Simple English)                                                 |
-- | ------- | ------------------------------------------------------ | --------------------------------------------------------------------------- |
-- | 1       | `DECLARE done INT DEFAULT 0;`                          | Create a variable named `done` to tell us when the cursor has no more data. |
-- | 2       | `DECLARE empName VARCHAR(100);`                        | Create a variable to store one employee name at a time.                     |
-- | 3       | `DECLARE cur CURSOR FOR SELECT name FROM emp;`         | Create a cursor named `cur` to go row-by-row through employee names.        |
-- | 4       | `DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;` | If the cursor reaches the end (no more data), set `done = 1`.               |
-- | 5       | `OPEN cur;`                                            | Start the cursor — ready to fetch rows.                                     |
-- | 6       | `FETCH cur INTO empName;`                              | Take the next name from the cursor and put it into `empName`.               |
-- | 7       | `IF done THEN LEAVE read_loop; END IF;`                | If no more data (`done = 1`), exit the loop.                                |
-- | 8       | `SELECT CONCAT('Hello, ', empName) AS greeting;`       | Print a message like “Hello, Ram”.                                          |
-- | 9       | `CLOSE cur;`                                           | Stop and close the cursor after all rows are processed.                     |
