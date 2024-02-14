WITH off_topic_cte AS(

  SELECT
    place_category,
    RANK() OVER(ORDER BY COUNT(maps_ugc_review.content_id) DESC) as offtopic_rank
  FROM place_info
  JOIN maps_ugc_review
  ON place_info.place_id = maps_ugc_review.place_id
  WHERE LOWER(content_tag) = 'off-topic'
  GROUP BY place_category
)
SELECT
  place_category
FROM off_topic_cte
WHERE offtopic_rank = 1