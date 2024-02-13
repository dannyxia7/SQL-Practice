WITH spend_cte AS(
  SELECT
    category,
    product,
    SUM(spend) as total_spend,
    RANK() OVER(
      PARTITION BY category
      ORDER BY SUM(spend) DESC
    ) as spend_rank
  FROM product_spend
  WHERE EXTRACT(YEAR from transaction_date) = 2022
  GROUP BY category, product
)

SELECT
  category,
  product,
  total_spend
FROM spend_cte
WHERE spend_rank <= 2