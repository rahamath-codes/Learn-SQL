/*
Data Definition Language :
DDL (Data Definition Language) is used to define, modify, or remove structures (schemas, tables, indexes, etc.) in a database.
*/
-- 1. CREATE: Create a new table
CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content TEXT,
    created_at DATE
);

-- 2. ALTER: Add a new column
ALTER TABLE notes ADD COLUMN author VARCHAR(50);

-- Modify a column's data type
ALTER TABLE notes MODIFY COLUMN title VARCHAR(150);

-- Rename a column
ALTER TABLE notes RENAME COLUMN author TO created_by;

-- 3. TRUNCATE: Delete all data from the table (faster than DELETE)
TRUNCATE TABLE notes;

-- 4. RENAME: Rename the table
RENAME TABLE notes TO note_entries;

-- 5. DROP: Delete the table entirely (structure + data)
DROP TABLE note_entries;

-- 6. DROP DATABASE: Delete entire database
CREATE DATABASE notestore;
DROP DATABASE notestore;
