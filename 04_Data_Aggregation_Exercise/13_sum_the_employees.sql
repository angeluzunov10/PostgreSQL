SELECT
	COUNT(CASE department_id WHEN 1 THEN 1 END) "Engineering",
	COUNT(CASE department_id WHEN 2 THEN 1 END) "Tool Design",
	COUNT(CASE department_id WHEN 3 THEN 1 END) "Sales",
	COUNT(CASE department_id WHEN 4 THEN 1 END) "Marketing",
	COUNT(CASE department_id WHEN 5 THEN 1 END) "Purchasing",
	COUNT(CASE department_id WHEN 6 THEN 1 END) "Research and Development",
	COUNT(CASE department_id WHEN 7 THEN 1 END) "Production"
FROM
	employees