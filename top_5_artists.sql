WITH ranked_cte AS(
  SELECT
    a.artist_name,
    COUNT(artist_name) as top10_count
  FROM artists a 
    JOIN songs s ON a.artist_id = s.artist_id
    JOIN global_song_rank g ON s.song_id = g.song_id
  WHERE g.rank <= 10
  GROUP BY artist_name
  ORDER BY COUNT(artist_name) DESC
),
count_cte AS(
  SELECT
    artist_name,
    DENSE_RANK() OVER(
      ORDER BY top10_count DESC
    ) as artist_rank
  FROM ranked_cte
)
SELECT
  artist_name,
  artist_rank
FROM count_cte
WHERE artist_rank <= 5