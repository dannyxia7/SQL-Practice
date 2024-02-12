SELECT
  tweet_count_per_user as tweet_bucket,
  COUNT(user_id) as users_num
FROM(
  SELECT user_id, COUNT(tweet_id) as tweet_count_per_user
  FROM tweets
  WHERE tweet_date between '2022-01-01' AND '2022-12-31'
  GROUP BY user_id) as total_tweets
  GROUP BY tweet_count_per_user