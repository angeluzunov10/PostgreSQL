SELECT
	cl.full_name,
	COUNT(co.car_id),
	SUM(co.bill) AS total_sum
FROM
	clients AS cl
JOIN
	courses AS co
ON
	cl.id = co.client_id
WHERE
	cl.full_name LIKE('_a%')
GROUP BY
	cl.full_name
HAVING
	COUNT(car_id) > 1
ORDER BY
	cl.full_name