-- Use sub queries to find information in the employees database
-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees
WHERE hire_date IN(
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010)

-- Find all the titles held by all employees with the first name Aamod.
-- 314 total titles, 6 unique titles
SELECT *
FROM titles
WHERE emp_no IN(
    SELECT emp_no
    FROM employees
    WHERE first_name = "Aamod")

SELECT title
FROM titles
WHERE emp_no IN(
    SELECT emp_no
    FROM employees
    WHERE first_name = "Aamod")
GROUP BY title;

-- How many people in the employees table are no longer working for the company?
SELECT COUNT(emp_no)
FROM employees
WHERE emp_no IN(
    SELECT emp_no
    FROM dept_emp
    WHERE to_date NOT LIKE "9999%")

-- Find all the current department managers that are female.
SELECT first_name,
last_name
FROM employees
WHERE gender = "F" AND emp_no IN(
    SELECT emp_no 
    FROM dept_manager
    WHERE to_date > NOW())

-- Find all the employees that currently have a higher than average salary.
-- 154543 rows in total. 
SELECT first_name, 
last_name, 
salary
FROM employees
JOIN salaries USING (emp_no)
WHERE to_date > NOW() AND salary > (
	SELECT AVG(salary)
    FROM salaries);

-- How many current salaries are within 1 standard deviation of the highest salary? 
--(Hint: you can use a built in function to calculate the standard deviation.) 
--What percentage of all salaries is this?

SELECT emp_no
FROM salaries
WHERE to_date > NOW() AND salary > (
    SELECT (MAX(salary) - STD(salary)) max_dev
    FROM salaries);