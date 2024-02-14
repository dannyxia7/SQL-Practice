SELECT 
  manufacturer,
  CONCAT('$', ROUND(SUM(total_sales)/1000000, 0), ' million') as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY ROUND(SUM(total_sales)/1000000, 0) DESC, manufacturer DESC