SELECT 
	u.user_name usuario, 
	COUNT(h.user_id) qt_de_musicas_ouvidas, 
	ROUND((SUM(s.single_length)/ 60), 2) total_minutos
FROM SpotifyClone.users AS u

INNER JOIN SpotifyClone.historic AS h ON h.user_id = u.user_id 
INNER JOIN SpotifyClone.singles AS s ON s.single_id = h.single_id

GROUP BY u.user_name
ORDER BY u.user_name;