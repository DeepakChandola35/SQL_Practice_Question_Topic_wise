-- Q: Find users whose total spend is above average spend of all users.

SELECT user_id
FROM orders
GROUP BY user_id
HAVING SUM(order_amount) >
(
  SELECT AVG(total_spend)
  FROM (
    SELECT SUM(order_amount) AS total_spend
    FROM orders
    GROUP BY user_id
  ) t
);

-- Q7️⃣ Find success rate per payment mode
SELECT payment_mode,
       COUNT(CASE WHEN status = 'success' THEN 1 END) * 100.0 / COUNT(*) AS success_rate
FROM payments
GROUP BY payment_mode;

-- Q8️⃣ Find users whose UPI spend > Card spend
SELECT user_id
FROM payments
GROUP BY user_id
HAVING
SUM(CASE WHEN payment_mode = 'UPI' THEN amount ELSE 0 END) >
SUM(CASE WHEN payment_mode = 'Card' THEN amount ELSE 0 END);

-- Q9️⃣ Find top payment mode by revenue
SELECT payment_mode, SUM(amount) AS total_revenue
FROM payments
WHERE status = 'success'
GROUP BY payment_mode
ORDER BY total_revenue DESC
LIMIT 1;



-- Q🔟 Find users who contribute more than 30% of total revenue
SELECT user_id
FROM payments
WHERE status = 'success'
GROUP BY user_id
HAVING SUM(amount) >
(
  SELECT 0.3 * SUM(amount)
  FROM payments
  WHERE status = 'success'
);