----Stores Preformance
SELECT * 
FROM chocolate_store_sales;
------------
SELECT 
CASE city
WHEN 'Toronto' THEN  'Canada'
WHEN 'Berlin' THEN 'Germany'
WHEN 'Paris' THEN 'France'
WHEN 'New York' THEN 'USA'
WHEN 'London' THEN 'UK'
ELSE 'Australia'
end   The_country,
city, store_name,profits

FROM (SELECT 
	t.country , t.city,
	t.store_name,
	ROUND(SUM(s.profit),2) profits
FROM sales s
LEFT JOIN stores t
ON s.store_id = t.store_id
GROUP BY t.country , t.city,
	t.store_name
)t

SELECT TOP 10*
FROM stores