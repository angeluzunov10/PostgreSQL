CREATE VIEW
	view_continents_countries_currencies_details
AS SELECT
	CONCAT_WS(
		': ',
		continents.continent_name,
		continents.continent_code
	) AS continent_details,
	CONCAT_WS(
		' - ',
		countries.country_name,
		countries.capital,
		countries.area_in_sq_km,
		'km2'
	) AS country_information,
	CONCAT(
		currencies.description,
		' (',
		currencies.currency_code,
		')'
	) AS currencies
FROM
	continents,
	countries,
	currencies
WHERE
	continents.continent_code = countries.continent_code
		AND
	countries.currency_code = currencies.currency_code
ORDER BY
	country_information,
	currencies
