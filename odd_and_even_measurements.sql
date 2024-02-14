WITH rank_cte AS (
  SELECT
    CAST(measurement_time as DATE) as measurement_day,
    ROW_NUMBER() OVER(
      PARTITION BY CAST(measurement_time as DATE)
      ORDER BY measurement_time
    ) as row_num,
    measurement_value
  FROM measurements
)
SELECT 
  measurement_day,
  SUM(measurement_value) FILTER (WHERE row_num % 2 = 1) as odd_sum,
  SUM(measurement_value) FILTER (WHERE row_num % 2 = 0) as even_sum
FROM rank_cte
GROUP BY measurement_day
ORDER BY measurement_day