/*
Query to get top 5 artists with the most frequent
songs appeared in the Top 10 `global_song_rank`
*/
WITH top_10_cte AS (
  SELECT
  artists.artist_name AS artist_name,
  DENSE_RANK() OVER(
  ORDER BY COUNT(songs.song_id) DESC
  ) AS artist_rank
FROM
  artists
INNER JOIN
  songs
ON
  artists.artist_id = songs.artist_id
INNER JOIN
  global_song_rank
ON
  global_song_rank.song_id = songs.song_id
WHERE
  global_song_rank.rank <= 10
GROUP BY
  artist_name
)

SELECT
  artist_name,
  artist_rank
FROM
  top_10_cte
WHERE
  artist_rank <= 5
ORDER BY
  artist_rank ASC;
