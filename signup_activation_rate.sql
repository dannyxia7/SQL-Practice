SELECT 
  ROUND(1.0 * SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END) /
  COUNT(distinct user_id), 2) as confirm_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id