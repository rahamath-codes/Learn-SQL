-- ========== 🔷 DDL: DATA DEFINITION LANGUAGE ==========
-- 1. Create a database and use it
CREATE DATABASE demo_sql;
USE demo_sql;

-- 2. Create a table
CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content TEXT,
    created_at DATE
);

-- 3. Alter table: Add a column
ALTER TABLE notes ADD COLUMN author VARCHAR(50);

-- 4. Rename column (if supported)
-- ALTER TABLE notes RENAME COLUMN author TO created_by;

-- 5. Truncate table: Remove all data, keep structure
-- TRUNCATE TABLE notes;

-- 6. Drop table (optional cleanup)
-- DROP TABLE notes;

-- ========== ✏️ DML: DATA MANIPULATION LANGUAGE ==========

-- Insert sample data
INSERT INTO notes (title, content, created_at, author) VALUES
('First Note', 'This is the first note.', '2025-06-26', 'Admin'),
('Second Note', 'Practice SQL basics.', '2025-06-26', 'John'),
('Third Note', 'Learn DML queries.', '2025-06-25', 'Jane');

-- Update a note
UPDATE notes 
SET content = 'Updated content for note', author = 'UpdatedUser'
WHERE id = 2;

-- Delete a specific note
DELETE FROM notes WHERE id = 3;

-- ========== 🔍 DQL: DATA QUERY LANGUAGE (SELECT) ==========

-- 1. Select all records
SELECT * FROM notes;

-- 2. Select specific columns
SELECT id, title FROM notes;

-- 3. Select with condition
SELECT * FROM notes WHERE created_at = '2025-06-26';

-- 4. Select with sorting
SELECT * FROM notes ORDER BY created_at DESC;

-- 5. Grouping (how many notes per date)
SELECT created_at, COUNT(*) AS note_count
FROM notes
GROUP BY created_at;

-- 6. Filtering groups (only where count > 1)
SELECT created_at, COUNT(*) AS note_count
FROM notes
GROUP BY created_at
HAVING COUNT(*) > 1;

-- 7. Limit results
SELECT * FROM notes LIMIT 2;

-- ==========  End of Script ==========
