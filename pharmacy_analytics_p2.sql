SELECT manufacturer, COUNT(drug) as drug_count,
  ABS(SUM(total_sales - cogs)) as total_loss
FROM pharmacy_sales
WHERE (total_sales - cogs) <= 0
GROUP BY manufacturer
ORDER BY total_loss desc