WITH supercloud AS (
	SELECT
	  con.customer_id,
	  COUNT(DISTINCT prod.product_category)
	FROM customer_contracts as con
	JOIN products as prod
	ON con.product_id = prod.product_id
	GROUP BY con.customer_id
)
SELECT
  customer_id
FROM supercloud
WHERE count = 3