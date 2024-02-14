WITH bookings_rank AS (
  SELECT 
    bookings.booking_id,
    bookings.user_id,
    bookings.booking_date,
    att.channel,
    RANK() OVER(
      PARTITION BY user_id
      ORDER BY booking_date
    ) AS booking_rank
  FROM bookings
  JOIN booking_attribution as att
  ON bookings.booking_id = att.booking_id
),
cte AS (
  SELECT
    channel,
    COUNT(*) as channel_booking
  FROM bookings_rank
  WHERE booking_rank = 1
  GROUP BY channel
)
SELECT 
  channel,
  ROUND(100.0 * channel_booking / ((SELECT SUM(channel_booking) FROM cte)), 0) as first_booking_pct
  FROM cte
  WHERE channel IS NOT NULL
  ORDER BY first_booking_pct DESC
  LIMIT 1