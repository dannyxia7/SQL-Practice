SELECT
  user_id
FROM emails
JOIN texts
on emails.email_id = texts.email_id
WHERE signup_action = 'Confirmed' AND EXTRACT(DAY FROM texts.action_date) - EXTRACT(DAY FROM emails.signup_date) 