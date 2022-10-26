SELECT
	u.user_name usuario,
    IF(YEAR(MAX(h.single_historic)) >= 2021, "Usuário ativo", "Usuário inativo") status_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.historic AS h ON h.user_id = u.user_id
GROUP BY usuario
ORDER BY usuario;