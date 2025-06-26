/*
Data Manipulations : DML (Data Manipulation Language) is used to manage data inside tables.
— inserting, updating, deleting, and reading records.
*/
-- 1. Create a database and use it
CREATE DATABASE dml_demo;
USE dml_demo;

-- 2. Create a table
CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content TEXT,
    created_at DATE
);

-- 3. INSERT – Add new records
INSERT INTO notes (title, content, created_at) VALUES
('First Note', 'Learn DML in SQL', '2025-06-26'),
('Second Note', 'Practice with examples', '2025-06-26'),
('Third Note', 'Test your knowledge', '2025-06-25');

-- 4. SELECT – Read data
-- Select all
SELECT * FROM notes;

-- Select specific columns
SELECT id, title FROM notes;

-- Select with condition
SELECT * FROM notes WHERE created_at = '2025-06-26';

-- 5. UPDATE – Modify data
-- Update a single column
UPDATE notes SET content = 'Updated content here' WHERE id = 1;

-- Update multiple columns
UPDATE notes 
SET title = 'Updated Title', content = 'New content for second note'
WHERE id = 2;

-- 6. DELETE – Remove data
-- Delete a specific row
DELETE FROM notes WHERE id = 3;

-- View the final data
SELECT * FROM notes;

-- (Optional) Delete all rows
-- DELETE FROM notes;

-- (Optional) Drop table and database if you want to clean up
-- DROP TABLE notes;
-- DROP DATABASE dml_demo;
