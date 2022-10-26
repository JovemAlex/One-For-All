SELECT
	a.artist_name AS artista,
    alb.album_name AS album
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albuns AS alb ON alb.artist_id = a.artist_id

WHERE a.artist_id = alb.artist_id AND a.artist_name = 'Elis Regina';