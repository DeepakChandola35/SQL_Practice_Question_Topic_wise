Q: Find users whose total spend is above average spend of all users.

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