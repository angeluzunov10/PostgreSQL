CREATE TABLE search_results ( 
	id SERIAL PRIMARY KEY, 
	address_name VARCHAR(50), 
	full_name VARCHAR(100), 
	level_of_bill VARCHAR(20), 
	make VARCHAR(30), 
	condition CHAR(1), 
	category_name VARCHAR(50) 
);


CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$	
	BEGIN
		TRUNCATE TABLE search_results;
		INSERT INTO search_results(address_name, full_name, level_of_bill, make, condition, category_name)
		SELECT
			a.name,
			cl.full_name,
			CASE
				WHEN cou.bill <= 20 THEN 'Low'
				WHEN cou.bill > 20 AND cou.bill <= 30 THEN 'Medium'
				WHEN cou.bill > 30 THEN 'High'
			END,
			cr.make,
			cr.condition,
			cat.name
		FROM
			addresses AS a
		JOIN
			courses AS cou
		ON
			cou.from_address_id = a.id
		JOIN 
			clients AS cl
		ON
			cl.id = cou.client_id
		JOIN
			cars AS cr
		ON 
			cr.id = cou.car_id
		JOIN 
			categories AS cat
		ON
			cr.category_id = cat.id
		WHERE 
			a.name = address_name
		ORDER BY
			cr.make,
			cl.full_name;
	END;
$$
LANGUAGE plpgsql