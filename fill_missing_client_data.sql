WITH count_cte AS(
  SELECT
    *,
    COUNT(category) OVER(
      ORDER BY product_id
    ) as count_category
  FROM products
)
SELECT 
  product_id,
  FIRST_VALUE(category) OVER(
    PARTITION by count_category
  ) as category,
  name
FROM count_cte