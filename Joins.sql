/*
Joins : A JOIN in SQL is used to combine rows from two or more tables based on a related column between them.
 It lets you get related data from multiple tables in a single query.
 
 Why Joins? 
-To relate and combine data spread across tables
-To avoid duplicate data by normalizing tables
-To query complex information involving multiple tables easily
*/

-- Create example database and use it
CREATE DATABASE joinExampleDB;
USE joinExampleDB;

-- Create 'categories' table
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

-- Create 'notes' table with a foreign key to 'categories'
CREATE TABLE notes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  content TEXT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert sample data into 'categories'
INSERT INTO categories VALUES
(1, 'Work'),
(2, 'Personal'),
(3, 'Other');

-- Insert sample data into 'notes'
INSERT INTO notes (title, content, category_id) VALUES
('Meeting Notes', 'Discuss project roadmap', 1),
('Shopping List', 'Buy milk and eggs', 2),
('Random Thoughts', 'Life is beautiful', NULL);

-- INNER JOIN: Returns only notes that have matching categories
-- Explanation: Returns rows where notes.category_id = categories.category_id
SELECT n.id, n.title, c.category_name
FROM notes n
INNER JOIN categories c ON n.category_id = c.category_id;

-- LEFT JOIN: Returns all notes, including those without categories
-- Explanation: Returns all rows from notes and matching categories if any, else NULL
SELECT n.id, n.title, c.category_name
FROM notes n
LEFT JOIN categories c ON n.category_id = c.category_id;

-- RIGHT JOIN: Returns all categories, including those without notes
-- Explanation: Returns all rows from categories and matching notes if any, else NULL
SELECT n.id, n.title, c.category_name
FROM notes n
RIGHT JOIN categories c ON n.category_id = c.category_id;

-- FULL OUTER JOIN (Emulated): Returns all notes and all categories
-- Explanation: Combines LEFT JOIN and RIGHT JOIN results to show all records from both tables
SELECT n.id, n.title, c.category_name
FROM notes n
LEFT JOIN categories c ON n.category_id = c.category_id

UNION

SELECT n.id, n.title, c.category_name
FROM notes n
RIGHT JOIN categories c ON n.category_id = c.category_id;

-- CROSS JOIN: Returns Cartesian product of notes and categories
-- Explanation: Every note combined with every category
SELECT n.id, n.title, c.category_name
FROM notes n
CROSS JOIN categories c;

-- SELF JOIN example on notes (joining notes with notes)
-- Explanation: Compare notes based on category_id to find pairs in the same category
SELECT n1.id AS note1_id, n1.title AS note1_title, n2.id AS note2_id, n2.title AS note2_title
FROM notes n1
JOIN notes n2 ON n1.category_id = n2.category_id AND n1.id <> n2.id;
