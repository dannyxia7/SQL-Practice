WITH total_count_cte AS(
  SELECT
    item_type,
    COUNT(*) as cat_item_count,
    SUM(square_footage) as total_sqft
  FROM inventory
  GROUP BY item_type
)
SELECT
  item_type,
  CASE 
    WHEN item_type = 'prime_eligible' THEN cat_item_count *  FLOOR(500000 / total_sqft)
    ELSE FLOOR((SELECT 500000%total_sqft FROM total_count_cte WHERE item_type = 'prime_eligible') / total_sqft) * cat_item_count
  END as item_count
FROM total_count_cte
ORDER BY item_type DESC;