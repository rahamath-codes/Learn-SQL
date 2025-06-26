-- Create 'notes' table with data types
CREATE TABLE notes (
  id INT PRIMARY KEY AUTO_INCREMENT,     -- Integer, auto-incremented ID
  title VARCHAR(100),                     -- Title as variable length string (max 100 chars)
  content TEXT,                          -- Content as text (long string)
  created_at DATE                        -- Date type column for creation date
);

-- Insert sample data into 'notes'
INSERT INTO notes (title, content, created_at) VALUES
('First Note', 'This is my first note.', '2025-06-20'),
('Shopping List', 'Buy milk and eggs.', '2025-06-22'),
('Appointment', NULL, '2025-06-25'),
('Another Note', 'Remember to call.', '2025-06-25');

-- Now example queries using operators:

-- 1. Equal to (=)
SELECT * FROM notes WHERE id = 1;

-- 2. Not equal to (<>)
SELECT * FROM notes WHERE title <> 'Shopping List';

-- 3. Greater than (>) on id
SELECT * FROM notes WHERE id > 2;

-- 4. Less than (<) on id
SELECT * FROM notes WHERE id < 4;

-- 5. Greater than or equal to (>=) on date
SELECT * FROM notes WHERE created_at >= '2025-06-22';

-- 6. Less than or equal to (<=) on date
SELECT * FROM notes WHERE created_at <= '2025-06-22';

-- 7. BETWEEN on id
SELECT * FROM notes WHERE id BETWEEN 2 AND 3;

-- 8. LIKE pattern matching
SELECT * FROM notes WHERE title LIKE 'A%';      -- titles starting with 'A'
SELECT * FROM notes WHERE content LIKE '%call%'; -- content containing 'call'

-- 9. IN operator on id
SELECT * FROM notes WHERE id IN (1, 3);

-- 10. AND operator
SELECT * FROM notes WHERE id > 1 AND created_at = '2025-06-25';

-- 11. OR operator
SELECT * FROM notes WHERE id = 1 OR created_at = '2025-06-25';

-- 12. NOT operator
SELECT * FROM notes WHERE NOT id = 2;

-- 13. IS NULL (for content)
SELECT * FROM notes WHERE content IS NULL;

-- 14. IS NOT NULL (for content)
SELECT * FROM notes WHERE content IS NOT NULL;