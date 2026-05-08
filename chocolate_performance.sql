----Stores Preformance

------------
SELECT 
	CASE city
	WHEN 'Toronto' THEN  'Canada'
	WHEN 'Berlin' THEN 'Germany'
	WHEN 'Paris' THEN 'France'
	WHEN 'New York' THEN 'USA'
	WHEN 'London' THEN 'UK'
	ELSE 'Australia'
	end   The_country,*
	INTO chocolate_2_sales
	FROM  chocolate_store_sales


