SELECT
	v.name AS volunteers,
	v.phone_number,
	LTRIM(v.address, 'Sofia, ')
FROM
	volunteers AS v
JOIN
	volunteers_departments AS vd
ON vd.id = v.department_id
WHERE
	vd.department_name = 'Education program assistant' AND
	v.address LIKE '%Sofia%'
ORDER BY
	v.name ASC