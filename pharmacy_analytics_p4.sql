WITH sales_cte AS(
  SELECT
    manufacturer,
    RANK() OVER(
      PARTITION BY manufacturer
      ORDER BY units_sold DESC
    ) as drugs_rank,
    units_sold,
    drug
  FROM pharmacy_sales
)
SELECT 
  manufacturer,
  drug
FROM sales_cte
WHERE drugs_rank <= 2