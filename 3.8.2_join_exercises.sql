USE join_example_db;

SELECT * FROM roles;

SELECT * FROM users;

SELECT * FROM roles
JOIN users ON roles.id = users.role_id;

SELECT * FROM roles
LEFT JOIN users ON roles.id = users.role_id;

SELECT * FROM roles
RIGHT JOIN users ON roles.id = users.role_id;

/* Although NOT explicitly covered IN the lesson, AGGREGATE functions LIKE count can be used /* with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query. */
SELECT count(users.id)
FROM users
JOIN roles ON roles.id = users.role_id
GROUP BY users.role_id;

-- Use the employees database.

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager",
dept_name AS "Department"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE YEAR(to_date) = 9999;

-- Find the name of all departments currently managed by women.
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager",
dept_name AS "Department"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE YEAR(to_date) = 9999 AND gender = "F";

-- Find the current titles of employees currently working in the Customer Service department.
SELECT title,
COUNT(*)
FROM titles
JOIN employees_with_departments ON titles.emp_no = employees_with_departments.emp_no
WHERE dept_name = "Customer Service" AND YEAR(to_date) = 9999
GROUP BY title;


-- Find the current salary of all current managers.
SELECT dept_name AS "Department",
CONCAT(employees.first_name, ' ', employees.last_name) AS "Name",
salary
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE YEAR(salaries.to_date) = 9999 
AND YEAR(dept_manager.to_date) = 9999;

-- Find the number of employees in each department.  | dept_no | dept_name          | num_employees 
SELECT departments.dept_no,
dept_name,
COUNT(emp_no) AS num_employees
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE YEAR(to_date) = 9999
GROUP BY departments.dept_no, dept_name;

-- Which department has the highest average salary? dept name and averge salary COME BACK to this one
SELECT dept_name,
AVG(salary) AS average_salary
FROM departments d1
JOIN dept_emp d2 ON d2.dept_no = d1.dept_no
JOIN salaries s ON s.emp_no = d2.emp_no
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department? first_name Last_name
SELECT first_name,
last_name
FROM salaries
JOIN employees ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON dept_emp.emp_no= employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?
SELECT 
first_name,
last_name,
salary,
dept_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE YEAR(dept_manager.to_date) = 9999
ORDER BY salary DESC
LIMIT 1;










