-- Top 10 SQL Interview Queries 
-- 1. Find the 3rd highest salary
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
________________________________________
-- 2. Find employees who have the same salary
SELECT salary, COUNT(*)
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;
________________________________________
-- 3. Find employees who joined in the year 2023
SELECT *
FROM employees
WHERE YEAR(joining_date) = 2023;
________________________________________
--  4. Find employees whose salary is between 50,000 and 100,000
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 100000;
________________________________________
--  5. Find total number of employees
SELECT COUNT(*) 
FROM employees;
________________________________________
--  6. Find employees whose name ends with 'n'
SELECT *
FROM employees
WHERE name LIKE '%n';
________________________________________
--  7. Find the department with the highest average salary
SELECT department
FROM employees
GROUP BY department
ORDER BY AVG(salary) DESC
LIMIT 1;
________________________________________
--  8. Find employees who earn more than their manager
-- (Assume manager_id refers to another employee in the same table)
SELECT e.name
FROM employees e
JOIN employees m
ON e.manager_id = m.id
WHERE e.salary > m.salary;
________________________________________
--   9. Find employees whose salary is the same as the maximum salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);
________________________________________
--   10. Find total salary of all employees
SELECT SUM(salary)
FROM employees;
________________________________________
