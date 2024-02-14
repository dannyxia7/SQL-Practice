WITH date_cte AS(
  SELECT
    user_id,
    transaction_date,
    RANK() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date DESC
    ) as recent_date
  FROM 
    user_transactions
)
SELECT 
  transaction_date,
  user_id,
  COUNT(user_id) as purchase_count
FROM
  date_cte
WHERE recent_date = 1
GROUP BY transaction_date, user_id