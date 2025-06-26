/*
Functions : Functions are predefined operations that take input(s) and return a result. 
MySQL has many built-in functions grouped by category (string, numeric, date/time, aggregate, etc).
*/
-- ---------------------------------------
-- Built-in Functions Examples
-- ---------------------------------------

-- String functions
SELECT CONCAT('Hello', ' ', 'World') AS greeting;
SELECT SUBSTRING('OpenAI ChatGPT', 8, 7) AS substring_example;
SELECT LENGTH('Hello') AS length_example;

-- Numeric functions
SELECT ABS(-25) AS absolute_value;
SELECT ROUND(3.14159, 2) AS rounded_value;
SELECT CEIL(2.3) AS ceiling_value;
SELECT FLOOR(2.9) AS floor_value;

-- Date/time functions
SELECT NOW() AS current_datetime;
SELECT CURDATE() AS current_date;
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') AS formatted_date;

-- Aggregate functions
SELECT COUNT(*) AS total_rows FROM notes;
SELECT SUM(price) AS total_price FROM sales;
SELECT AVG(score) AS average_score FROM exams;
SELECT MAX(score) AS max_score FROM exams;
SELECT MIN(score) AS min_score FROM exams;

-- Control flow functions
SELECT IF(75 > 50, 'Pass', 'Fail') AS pass_fail;
SELECT CASE
    WHEN score >= 90 THEN 'A'
    WHEN score >= 75 THEN 'B'
    ELSE 'C'
END AS grade
FROM exams;

-- ---------------------------------------
-- User-Defined Functions (UDFs)
-- ---------------------------------------

DELIMITER //

-- Example 1: Add 10 to a number
CREATE FUNCTION add_ten(num INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN num + 10;
END;
//

-- Example 2: Get abbreviated month name from month number
CREATE FUNCTION get_month_abbr(month_num INT)
RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
    DECLARE mon VARCHAR(3);
    SET mon = CASE month_num
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
        ELSE 'N/A'
    END;
    RETURN mon;
END;
//

DELIMITER ;

-- Calling User-Defined Functions
SELECT add_ten(5) AS add_ten_result;        -- Returns 15
SELECT get_month_abbr(4) AS month_abbr;    -- Returns 'Apr'
