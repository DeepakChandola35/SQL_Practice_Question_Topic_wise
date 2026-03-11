-- Here are 10 more SQL interview practice questions focused on JOIN + GROUP BY (Set 3).
-- Assume three tables:
-- Customers
-- customer_id, customer_name
-- Orders
-- order_id, customer_id, product_id, amount
-- Products
-- product_id, product_name, category

--   SQL JOIN + GROUP BY Questions (Set 3)
--   1️⃣ Find total sales for each product
SELECT p.product_name, SUM(o.amount) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

--   2️⃣ Find number of orders for each product
SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

--   3️⃣ Find average order amount for each product
SELECT p.product_name, AVG(o.amount) AS avg_amount
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

--   4️⃣ Find total sales for each product category
SELECT p.category, SUM(o.amount) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category;

--   5️⃣ Find category with the highest sales
SELECT p.category, SUM(o.amount) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC
LIMIT 1;
--   6️⃣ Find number of customers who bought each product
SELECT p.product_name, COUNT(DISTINCT o.customer_id) AS customers
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;
--   7️⃣ Find total spending by each customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--   8️⃣ Find customers who spent more than 5000
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 5000;

--   9️⃣ Find number of products in each category
SELECT category, COUNT(product_id) AS total_products
FROM products
GROUP BY category;

--   🔟 Find total sales and total orders per customer
SELECT c.customer_name,
COUNT(o.order_id) AS total_orders,
SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


