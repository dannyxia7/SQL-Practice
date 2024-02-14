WITH ride_rank_cte AS (
  SELECT 
    users.user_id,
    users.registration_date,
    rides.ride_id,
    rides.ride_date,
    ROW_NUMBER() OVER(
      PARTITION BY users.user_id
      ORDER BY ride_date
    ) as ride_rank
  FROM users
  JOIN rides
  ON users.user_id = rides.user_id
)
SELECT 
  ROUND(AVG(ride_date - registration_date), 2)
FROM ride_rank_cte
WHERE user_id in (SELECT user_id FROM ride_rank_cte WHERE ride_date = registration_date)
AND ride_rank = 2