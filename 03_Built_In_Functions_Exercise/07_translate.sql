SELECT
	capital,
	TRANSLATE(capital, 'áãåçéíñóú', 'aaaceinou')
FROM countries