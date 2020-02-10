#Create a file named 3.5.1_where_exercises.sql. Make sure to use the employees database
USE employees;

SELECT * FROM employees;

#Find all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

#Find all employees whose last name starts with 'E'
SELECT * FROM employees
WHERE last_name LIKE 'E%';

#Find all employees hired in the 90s
SELECT * FROM employees
WHERE hire_date LIKE "199%";

#Find all employees born on Christmas
SELECT * FROM employees 
WHERE birth_date LIKE '%12-25';

#Find all employees with a 'q' in their last name
SELECT * FROM employees
WHERE last_name LIKE '%q%';

/* 
Find all employees with a 'q' in their last name — 1,873 rows.
Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
Find all employees whose last name starts or ends with 'E' — 30,723 rows.
Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
Find all employees hired in the 90s and born on Christmas — 362 rows.
Find all employees with a 'q' in their last name but not 'qu' — 547 rows. */