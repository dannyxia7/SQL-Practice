WITH ranked_cte AS(
  SELECT
    user_id,
    spend,
    transaction_date,
    RANK() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date
    ) as day
  FROM  transactions
)
SELECT 
  user_id,
  spend,
  transaction_date
FROM ranked_cte
WHERE day = 3