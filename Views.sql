-- ===== 1. Create Database and Table =====
CREATE DATABASE school;
USE school;

CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  class VARCHAR(10),
  marks INT
);

INSERT INTO students VALUES
(1, 'Ravi', '10A', 85),
(2, 'Priya', '10A', 90),
(3, 'Arjun', '10B', 78),
(4, 'Sita', '10B', 88);

-- ===== 2. Create a Simple View (Updatable View) =====
-- View showing only id and name from students table
CREATE VIEW student_names AS
SELECT id, name FROM students;

-- Use the view
SELECT * FROM student_names;

-- Update through the view (allowed because simple view)
UPDATE student_names SET name = 'Ravi Kumar' WHERE id = 1;

-- Check original table updated
SELECT * FROM students WHERE id = 1;

-- ===== 3. Create a Complex View (Non-Updatable View) =====
-- View with GROUP BY and aggregation
CREATE VIEW class_summary AS
SELECT class, COUNT(*) AS total_students, AVG(marks) AS avg_marks
FROM students
GROUP BY class;

-- Use the view
SELECT * FROM class_summary;

-- Try update on non-updatable view (this will fail or no effect)
-- Uncomment to test - most DBs will reject this
-- UPDATE class_summary SET avg_marks = 95 WHERE class = '10A';

-- ===== Notes =====
/*
1. Views are virtual tables: no data stored separately, data comes from underlying tables.
2. Updatable views are simple SELECT queries without joins, group by, or aggregates.
3. Updates/Inserts/Deletes on updatable views affect the original table.
4. Complex views with joins, group by, or aggregates are non-updatable (read-only).
5. Views help simplify queries, improve security, and provide abstraction.
*/
