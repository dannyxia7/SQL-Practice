SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) as laptop_views,
  SUM(CASE WHEN device_type IN ('phone', 'tablet') THEN 1 ELSE 0 END) as mobile_views
FROM viewership