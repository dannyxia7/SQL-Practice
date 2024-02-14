WITH spend_cte AS(
  SELECT 
    EXTRACT(YEAR FROM transaction_date) as year,
    product_id,
    spend as curr_year_spend,
    LAG(spend, 1) OVER(
      PARTITION BY product_id
    ) as prev_year_spend
  FROM user_transactions
)
SELECT 
  *,
  ROUND(100 * (curr_year_spend / prev_year_spend - 1), 2) as yoy_rate
FROM spend_cte
ORDER BY product_id, year