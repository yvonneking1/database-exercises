#Create a file named 3.5.1_where_exercises.sql. Make sure to use the employees database
USE employees;

SELECT * FROM employees;

#Find all employees with first names 'Irena', 'Vidya', or 'Maya'
# version 2 Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN
# Add a condition to the previous query to find everybody with those names who is also male
SELECT * FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena'
OR first_name =  'Vidya' 
OR first_name = 'Maya');

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

#Find all employees whose last name starts or ends with 'E'
SELECT * FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%e';

#Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' 
SELECT * FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%e';

#Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25';

#Find all employees with a 'q' in their last name but not 'qu' — 547 rows
SELECT * FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
