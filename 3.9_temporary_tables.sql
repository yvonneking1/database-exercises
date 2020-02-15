-- Using the example from the lesson, re-create the employees_with_departments table.
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- Update the table so that full name column contains the correct data
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?

USE curie_957;


CREATE TABLE employees_with_departments AS
SELECT *
FROM employees.employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(256);

UPDATE employees_with_departments SET full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;


-- Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. 
--For example, 1.99 should become 199.
CREATE TEMPORARY TABLE payment AS
SELECT *
FROM sakila.payment;

ALTER TABLE payment ADD amount_1 INT(7)

UPDATE payment SET amount_1 = amount * 100;

ALTER TABLE payment DROP COLUMN amount;

ALTER TABLE payment CHANGE amount_1 amount INT(7);

-- Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, 
-- you should use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?
-- salary, departments

--AVERAGE of each dept the x
CREATE TEMPORARY TABLE avgs_per_dep AS SELECT dept_name,
AVG(salary) AS avergaes
FROM employees.departments
JOIN employees.dept_emp USING (dept_no)
JOIN employees.salaries USING (emp_no)
GROUP BY dept_name;

CREATE TEMPORARY TABLE salaries AS SELECT *
FROM employees.salaries;

SELECT AVG(salary) 
FROM salaries;

ALTER TABLE avgs_per_dep ADD overall_average DECIMAL(14,4);

UPDATE avgs_per_dep SET overall_average = 63810.7448;

--mean
SELECT AVG(salary)
FROM salaries;

--standard deviation
SELECT STD(salary)
FROM salaries;


CREATE TEMPORARY TABLE salaries AS SELECT *
FROM employees.salaries;

ALTER TABLE avgs_per_dep ADD std_dev DECIMAL(11, 11);







-- Z = Z-Score
-- X = Actual value
-- μ = Mean value
-- σ = Standard Deviation
-- -- select (value -
--   (select avg(value) 
--   from table
--   group by grouper))/stddev(value)
-- from table;