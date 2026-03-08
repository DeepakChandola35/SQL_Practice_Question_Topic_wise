\-- Top 10 SQL Interview Queries 
-- 1️⃣ Find employees who have the highest salary in each department
SELECT *
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);
________________________________________
-- 2️⃣ Find employees whose salary is above department average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
________________________________________
-- 3️⃣ Find employees hired in the last 6 months
SELECT *
FROM employees
WHERE joining_date >= CURDATE() - INTERVAL 6 MONTH;
________________________________________
-- 4️⃣ Find employees who work in the same department
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;
________________________________________

-- 5️⃣ Find employees whose salary is the lowest in the company
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);
________________________________________
-- 6️⃣ Find number of employees hired each year
SELECT YEAR(joining_date), COUNT(*)
FROM employees
GROUP BY YEAR(joining_date);
________________________________________
-- 7️⃣ Find employees whose name contains 'ar'
SELECT *
FROM employees
WHERE name LIKE '%ar%';
________________________________________
-- 8️⃣ Find employees with salary greater than 50000 and from IT department
SELECT *
FROM employees
WHERE salary > 50000
AND department = 'IT';
________________________________________
-- 9️⃣ Find total employees in each department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
________________________________________


-- 🔟 Find employees sorted by salary (highest first)
SELECT *
FROM employees
ORDER BY salary DESC;
________________________________________
