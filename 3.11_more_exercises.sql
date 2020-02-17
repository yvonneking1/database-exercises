-- How much do the current managers of each department get paid, relative to the average salary for the department? 

CREATE TEMPORARY TABLE dept_avg SELECT dept_name,
dept_no,
AVG(salary) AS avg_sal
FROM employees.departments
JOIN employees.dept_emp USING (dept_no)
JOIN employees.salaries USING (emp_no)
WHERE salaries.to_date > NOW()
GROUP BY dept_name;


CREATE TEMPORARY TABLE dept_mg_sal AS SELECT dm.emp_no,
dept.dept_name,
dept.dept_no,
salary
FROM employees.departments dept
JOIN employees.dept_manager dm USING (dept_no)
JOIN employees.salaries sal USING (emp_no)
WHERE dm.to_date > NOW()
AND sal.to_date > NOW();


SELECT dept_avg.dept_name,
(salary - avg_sal) AS difference
FROM dept_avg
JOIN dept_mg_sal USING (dept_no)
ORDER BY difference;

-- Use the world database for the questions below.

-- What languages are spoken in Santa Monica?
SELECT cl.Language,
cl.Percentage
FROM city
JOIN countrylanguage cl USING (CountryCode)
WHERE city.name = "Santa Monica"
ORDER BY cl.percentage;

-- How many different countries are in each region?
SELECT region,
COUNT(*) AS num_countries
FROM country
GROUP BY region
ORDER BY num_countries;

-- What is the population for each region?
SELECT region,
SUM(c.population) as population
FROM country
GROUP BY region
ORDER BY population DESC;

-- What is the population for each continent?
SELECT Continent,
SUM(population) AS population
FROM country
GROUP BY Continent
ORDER BY population DESC;

-- What is the average life expectancy globally?
SELECT AVG(LifeExpectancy)
FROM country;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest
SELECT region,
AVG(LifeExpectancy) AS life_expectancy
FROM country
GROUP BY region
ORDER BY life_expectancy;

SELECT Continent,
AVG(LifeExpectancy) AS life_expectancy
FROM country
GROUP BY Continent
ORDER BY life_expectancy;
