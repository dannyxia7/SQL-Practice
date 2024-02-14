SELECT
  ROUND(100.0 * SUM(CASE WHEN caller.country_id <> receiver.country_id THEN 1 ELSE 0 END) /
  COUNT(*), 1) as international_calls_pct
FROM phone_calls as calls
LEFT JOIN phone_info as caller
ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info receiver
ON calls.receiver_id = receiver.caller_id