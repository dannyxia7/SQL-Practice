SELECT
  card_name,
  issued_amount
FROM(
  SELECT 
    card_name,
    issued_amount,
    RANK() OVER(
      PARTITION BY card_name
      ORDER BY issue_year, issue_month
    ) AS month_rank
  FROM monthly_cards_issued
) as subquery
WHERE month_rank = 1
ORDER BY issued_amount DESC