WITH series_cte AS(
  SELECT searches, GENERATE_SERIES(1, num_users) FROM search_frequency
  ORDER BY searches
)
SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY searches) as median
FROM series_cte