

--  Top 10 SQL Query Interview Questions

--  1️⃣ Find the **second highest salary**

sql
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary) FROM employees
);


--  2️⃣ Find **duplicate records** in a table

sql
SELECT name, COUNT(*)
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;


--  3️⃣ Find employees whose **salary is greater than the average salary**

sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);


--  4️⃣ Find **total salary department wise**

sql
SELECT department, SUM(salary)
FROM employees
GROUP BY department;


--  5️⃣ Find **top 3 highest salaries**

sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;



--  6️⃣ Find employees who **joined in the last 30 days**

sql
SELECT *
FROM employees
WHERE joining_date >= CURDATE() - INTERVAL 30 DAY;




--  7️⃣ Count number of employees in each department

sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department;




--  8️⃣ Find employees who **do not have a manager**

sql
SELECT *
FROM employees
WHERE manager_id IS NULL;


--  9️⃣ Find the **highest salary in each department**

sql
SELECT department, MAX(salary)
FROM employees
GROUP BY department;


--  🔟 Find employees whose **name starts with -- A-- **


SELECT *
FROM employees
WHERE name LIKE -- A%-- ;

