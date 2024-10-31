SELECT
	d.first_name,
	d.last_name,
	c.make,
	c.model,
	c.mileage
FROM
	cars AS c
JOIN
	cars_drivers AS cd
ON
	c.id = cd.car_id
JOIN
	drivers AS d
ON
	d.id = cd.driver_id
WHERE
	mileage IS NOT NULL
ORDER BY
	mileage DESC,
	d.first_name ASC