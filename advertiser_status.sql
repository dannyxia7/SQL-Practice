SELECT
  COALESCE(ad.user_id, dp.user_id) as user_id,
  CASE
    WHEN paid is NULL THEN 'CHURN' 
    WHEN paid is NOT NULL and status = 'NEW' THEN 'EXISTING'
    WHEN paid is NOT NULL and status = 'EXISTING' THEN 'EXISTING'
    WHEN paid is NOT NULL and status = 'CHURN' THEN 'RESURRECT'
    WHEN paid is NOT NULL and status = 'RESURRECT' THEN 'EXISTING'
    WHEN paid is NOT NULL and status IS NULL THEN 'NEW'
    END as new_status
FROM advertiser as ad
FULL OUTER JOIN daily_pay as dp
ON ad.user_id = dp.user_id
ORDER BY user_id;