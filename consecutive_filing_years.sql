WITH turbo_cte AS(
  SELECT
    user_id,
    CASE WHEN product LIKE '%TurboTax%' THEN 1 END as turbo_user,
    DENSE_RANK() OVER(
      PARTITION BY user_id
      ORDER BY filing_date
    ) as turbo_rank
  FROM filed_taxes
)
SELECT DISTINCT
  user_id
FROM turbo_cte
WHERE turbo_user = 1 AND turbo_rank >= 3