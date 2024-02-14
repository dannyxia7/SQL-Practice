WITH row_transactions AS (
  SELECT
    user_id,
    transaction_date,
    ROW_NUMBER() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date
    )
  FROM transactions
)

SELECT 
  user_id
FROM row_transactions
WHERE row_number = 3