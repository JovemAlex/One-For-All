SELECT
	s.single_name AS cancao,
    COUNT(h.single_id) AS reproducoes
FROM SpotifyClone.singles AS s
INNER JOIN SpotifyClone.historic AS h ON h.single_id = s.single_id

GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;