SELECT
	COUNT(a)
FROM
	(
		SELECT
			*
		FROM
			customers
		WHERE
			last_name = 'Hahn'
	) AS a