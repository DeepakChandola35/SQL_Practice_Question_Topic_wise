
 --  SQL JOIN + GROUP BY Practice Questions (Set 2)
--  1️⃣ Find total order amount for each customer
SELECT c.customer_name, SUM(o.amount) AS total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--  2️⃣ Find number of orders placed by each customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--  3️⃣ Find customers who placed more than 5 orders
SELECT c.customer_name, COUNT(o.order_id)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 5;

--  4️⃣ Find customer with the highest total purchase
SELECT c.customer_name, SUM(o.amount) AS total_purchase
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_purchase DESC
LIMIT 1;

--  5️⃣Find average order amount for each customer
SELECT c.customer_name, AVG(o.amount) AS avg_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--  6️⃣ Find total number of customers who placed orders
SELECT COUNT(DISTINCT c.customer_id)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

--  7️⃣ Find customers whose total purchase is greater than 10000
SELECT c.customer_name, SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 10000;

--  8️⃣ Find number of orders and total revenue
SELECT COUNT(o.order_id) AS total_orders,
SUM(o.amount) AS total_revenue
FROM orders o;

--  9️⃣ Find customers who have not placed any orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--  🔟 Find top 3 customers with highest purchase amount
SELECT c.customer_name, SUM(o.amount) AS total_purchase
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_purchase DESC
LIMIT 3;


