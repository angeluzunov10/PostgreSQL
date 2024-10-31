SELECT
	COUNT(countries_without_code)
FROM(
SELECT
	*
FROM
	countries AS c
LEFT JOIN
	mountains_countries AS mc
USING
	(country_code)
WHERE
	mc.mountain_id IS NULL
) AS countries_without_code
	
