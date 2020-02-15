-- 1. Write a query that returns all employees (emp_no), their department number, 
--their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.


SELECT e.emp_no,
d.dept_no,
e.hire_date,
to_date,
IF (to_date > NOW(), 1, 0) as is_current_employee
FROM employees e
JOIN dept_emp d USING (emp_no);


-- 2. Write a query that returns all employee names, and a new column 'alpha_group' that returns 
--'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
-- goignt to need DB: employees

SELECT first_name,
last_name,
    CASE 
        WHEN last_name REGEXP '^[a-h]' THEN "A-H"
        WHEN last_name REGEXP '^[i-q]' THEN "I-Q"
        WHEN last_name REGEXP '^[r-z]' THEN "R-Z"
        ELSE "Other"
        END AS alpha_group
FROM employees;
      


-- 3. How many employees were born in each decade?
-- need, birthdate and emp_no -- employees -- going to be counting 1950-1959
SELECT COUNT(*),
CASE 
	WHEN YEAR(birth_date) BETWEEN 1950 AND 1959 THEN "50's"
	WHEN YEAR(birth_date) BETWEEN 1960 AND 1969 THEN "60's"
	ELSE "Other"
	END AS decade
FROM employees
GROUP BY decade;


-- BONUS

-- What is the average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?


SELECT AVG(salary) AS average_salary,
CASE
    WHEN dept_name IN ("finance", "human resources") THEN "Finance & HR"
    WHEN dept_name IN ("sales", "marketing") THEN "Sales & Marketing"
    WHEN dept_name IN ("production", "quality management") THEN "PROD & QM"
    WHEN dept_name IN ("research", "development") THEN "R&D"
    ELSE dept_name
    END AS dept_group
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
GROUP BY dept_group;