SELECT
	COUNT(DISTINCT sing.single_id) AS cancoes,
  COUNT(DISTINCT art.artist_id) AS artistas,
  COUNT(DISTINCT alb.album_name) AS albuns
FROM SpotifyClone.singles AS sing
INNER JOIN SpotifyClone.artists AS art ON sing.artist_id = art.artist_id
INNER JOIN SpotifyClone.albuns AS alb ON alb.artist_id = art.artist_id;