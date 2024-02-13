SELECT
  age_bucket,
  ROUND(100.0 * SUM(time_spent) FILTER(WHERE activity_type = 'open') / 
    SUM(time_spent), 2) as open_perc,
  ROUND(100.0 * SUM(time_spent) FILTER(WHERE activity_type = 'send') / 
    SUM(time_spent), 2) as send_perc
FROM activities act INNER JOIN age_breakdown age
ON act.user_id = age.user_id 
WHERE activity_type IN ('send', 'open')
GROUP BY age_bucket