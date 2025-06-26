-- To view the databases in the sql 
-- show  databases;
-- To create a databse
-- CREATE DATABASE STUDENT;
-- To create a Table
-- CREATE TABLE PRACTICE.STUDENT(ID INT, NAME varchar(10), EMAIL VARCHAR(20),CLASS varchar(5));
-- To add/Insert rows
-- insert into practice.student values(2,'Jameela','jamee@gmail.com','Phsio'),
-- (3,'Vignesh','vignesh@gmail.com','xp js'),
-- (4,'Suresh','suresh@gmail.com','xp js'),
-- (5,'Srini','srini@gmail.com','man');
-- Alter/Update the column in the table
-- ALTER TABLE student ADD department VARCHAR(5); -- Adds a new column department to the student table
-- UPDATE student SET department = 'ECE' WHERE class = 'java' OR class = 'man' OR class = 'xp js';
-- TO Show TABLE 
-- SHOW TABLES 
-- To Describe a Table;
-- Describe student;
-- create table employee(
-- eid INT primary key,
-- ename varchar(20) Not null,
-- email varchar(30) unique,
-- erole varchar(20),
-- salary INT
-- );
-- INSERT INTO employee (eid, ename, email, erole, salary) VALUES
-- (201, 'Jesse', 'jesse@example.com', 'Developer', 60000),
-- (202, 'Jane', 'jane@example.com', 'Tester', 52000),
-- (203, 'Suresh', 'suresh@example.com', 'Manager', 75000),
-- (204, 'Benazir', 'benazir@example.com', 'HR', 55000),
-- (205, 'Vignesh', 'vignesh@example.com', 'Developer', 61000),
-- (206, 'Srinivasan', 'srinivasan@example.com', 'Support', 47000),
-- (207, 'Logesh', 'logesh@example.com', 'Designer', 49000),
-- (208, 'Dhinesh', 'dhinesh@example.com', 'Tester', 51000),
-- (209, 'Sabari', 'sabari@example.com', 'Developer', 60500),
-- (210, 'Suji', 'suji@example.com', 'HR', 54000),
-- (211, 'Amar', 'amar@example.com', 'Developer', 63000),
-- (212, 'Saran', 'saran@example.com', 'Support', 46000),
-- (213, 'Bhuvan', 'bhuvan@example.com', 'Designer', 50000),
-- (214, 'Sribinu', 'sribinu@example.com', 'Manager', 72000),
-- (215, 'Ammaar', 'ammaar@example.com', 'Tester', 52500),
-- (216,'Neethu Shri','neethushri@gmail.com','Trainer',50000,50000*12);
-- desc employee
-- select * from employee
-- where erole in ('developer','tester','manager')
-- order by salary desc;
-- select ename, salary from employee where salary = (select max(salary) from employee); 
-- update employee 
-- set salary = 1000000
-- where ename in ('rahmath','sribinu');
-- select * from employee where ename like '_am%';
-- select ename,salary from employee where salary between 50000 and 1000000 order by salary;
-- update employee set salary = 96000 where ename like 'Benazir';
-- select * from employee limit 5;
-- -------------------------------------------------------------------------------------------------
-- From student table :
-- SELECT * FROM practice.student where class = 'java';
-- select * from practice.student;
-- TO AVOID USING SCHEMA NAME WE HAVE TO SET THE SCHEMA DEFUALT BY USING 'USE SCHEMA-NAME'
-- USE practice;
-- select * from student;
-- If you're sure about what you're doing, disable safe updates temporarily for your session:
-- SET SQL_SAFE_UPDATES = 0; -- Disable Safe Update Mode (One-Time Change) 
-- update student set DEPARTMENT = 'Engr'  where  DEPARTMENT = 'ECE';
use practice;
select * from emp inner join branch on emp.bid = branch.bid order by id;
update emp set bid = 2 where id%2 = 0 and id>3;


  
















