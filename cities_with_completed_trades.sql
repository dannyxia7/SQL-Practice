SELECT 
  users.city,
  COUNT(trades.order_id) as total_orders
FROM trades
JOIN users
ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY total_orders DESC
LIMIT 3