-- | Operation    | Command           | Description                        |
-- | ------------ | ----------------- | ---------------------------------- |
-- | Create DB    | `CREATE DATABASE` | Create a new database (schema)     |
-- | Use DB       | `USE`             | Select the database to work on     |
-- | Create Table | `CREATE TABLE`    | Create a table inside the database |
-- | Insert       | `INSERT INTO`     | Add new records (rows)             |
-- | Select       | `SELECT`          | Read data from the table           |
-- | Update       | `UPDATE`          | Modify existing records            |
-- | Delete       | `DELETE`          | Remove records                     |
-- | Drop Table   | `DROP TABLE`      | Delete the entire table            |
-- | Drop DB      | `DROP DATABASE`   | Delete the whole database          |

-- 1. Create a new database/schema named 'mydb'
CREATE DATABASE mydb;

-- 2. Select/use the database 'mydb'
USE mydb;

-- 3. Create a table named 'notes' inside 'mydb'
CREATE TABLE notes (
  id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier, auto-increments
  title VARCHAR(100),                  -- Title of the note
  content TEXT                        -- Content of the note
);

-- 4. CREATE operation (INSERT)
-- Add a new note to the notes table
INSERT INTO notes (title, content)
VALUES ('First Note', 'This is the content of the first note.');

-- 5. READ operation (SELECT)
-- Retrieve all notes from the table
SELECT * FROM notes;

-- 6. UPDATE operation
-- Update the title and content of the note with id = 1
UPDATE notes
SET title = 'Updated First Note',
    content = 'This is the updated content.'
WHERE id = 1;

-- 7. DELETE operation
-- Delete the note with id = 1
DELETE FROM notes
WHERE id = 1;

-- 8. Drop the table 'notes' from the current database
-- DROP TABLE notes;

-- 9. Drop the entire database/schema 'mydb'
-- DROP DATABASE mydb;
