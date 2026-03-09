--  Top 10 SQL Interview Questions (JOIN + GROUP BY)
--  1. Find number of employees in each department
SELECT d.department_name, COUNT(e.id) AS total_employees
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  2. Find total salary paid in each department
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  3. Find average salary in each department
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  4. Find department with highest total salary
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC
LIMIT 1;

--  5. Find departments having more than 5 employees
SELECT d.department_name, COUNT(e.id)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.id) > 5;

--  6. Find maximum salary in each department
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  7. Find minimum salary in each department
SELECT d.department_name, MIN(e.salary) AS lowest_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  8. Find departments with average salary greater than 60000
SELECT d.department_name, AVG(e.salary)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;

--  9. Find employee count and total salary for each department
SELECT d.department_name,
COUNT(e.id) AS total_employees,
SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  10. Find department-wise employee list sorted by salary
SELECT d.department_name, e.name, e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_name, e.salary DESC;

