---- Find the discount impact ------

/*-Does a higher discount actually lead
to a significant increase in quantity*/

SELECT 
	ne_discount,
	SUM(quantity) number_of_orders,
	
	ROUND(SUM(revenue),2) revenues,
	ROUND(SUM(profit),2) profits


FROM(SELECT 
	quantity,
	unit_price,
	CONCAT(CAST(ROUND((discount ),2) AS FLOAT)/100, '%') ne_discount,
	revenue,
	profit

FROM(SELECT 
	quantity,
	unit_price,
	REPLACE(discount, ':', '') discount,
	revenue,
	profit
FROM chocolate_database	)F


)T
GROUP BY ne_discount
ORDER BY number_of_orders DESC

/*- -REVENUE LEAKAGE---
  Find the difference between potential revenue vs acual revenue */
SELECT 
    discounting,
	(COUNT(quantity)) / unique_quantity quantity_perecent,
	(sum(potential_re)/pot_revenues) po_perecent,
	(SUM(actual_rev))/ actual_rev actual_perecent

FROM(SELECT 
    *,
	COUNT(quantity) OVER() unique_quantity,
	(SUM(potential_re)OVER()) pot_revenues,
	(SUM(actual_revenue)OVER()) actual_rev

FROM

(SELECT 
quantity,
potential_re,
CONCAT(ROUND((discount),2)/100,'%') discounting,
actual_revenue
FROM 
(SELECT 
	quantity,
    REPLACE(discount, ':', '') discount,
	(quantity * unit_price) potential_re,
	revenue as actual_revenue
FROM chocolate_database
 )F
 )T
 GROUP BY discounting
 )V
