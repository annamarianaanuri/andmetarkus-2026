-- Leia müügisummad toodete kaupa – toote ID ja müügisumma

SELECT product_id, ROUND(SUM(sale_sum),0) as sale_sum_product
FROM sales_table
GROUP BY product_id
ORDER BY product_id;

-- Leia müügisummad klientide kaupa – kliendi ID ja müügisumma
SELECT customer_id, ROUND(SUM(sale_sum),0) AS sale_sum_customer
FROM sales_table 
GROUP BY customer_id 
ORDER BY customer_id;

-- Leia müügisummad müügiesindajate kaupa – kliendiesindaja ID ja müügisumma
SELECT sales_rep_id, ROUND(SUM(sale_sum),0) AS sale_sum_rep
FROM sales_table 
GROUP BY sales_rep_id 
ORDER BY sales_rep_id;

-- Leia müügisummad aastate kaupa – aasta ja müügisumma
SELECT EXTRACT(YEAR FROM sale_date) AS sale_year, ROUND(SUM(sale_sum),0) AS sale_sum_year 
FROM sales_table
GROUP BY sale_year 
ORDER BY sale_year;

-- Lisa müükidele müügisumma kategooriad
-- 1.Large Sale > 500
-- 2.Medium Sale <= 500 and >= 250
-- 3.Small Sale < 250
SELECT *,
CASE
WHEN sale_sum < 250 THEN 'Small Sale'
WHEN sale_sum >= 250 AND sale_sum <= 500 THEN 'Medium Sale'
WHEN sale_sum >= 500 THEN 'Large Sale'
ELSE 'ERROR'
END AS sale_category
FROM sales_table;

--- Lisa see tulp müügitabelisse
ALTER TABLE sales_table ADD COLUMN sale_category VARCHAR(50);

-- Muuda tulba sisu
UPDATE sales_table SET sale_category =
CASE
WHEN sale_sum < 250 THEN 'Small Sale'
WHEN sale_sum >= 250 AND sale_sum <= 500 THEN 'Medium Sale'
WHEN sale_sum >= 500 THEN 'Large Sale'
ELSE 'ERROR'
END;

-- Kontrolli 
SELECT * 
FROM sales_table st;

-- Leia müükide arv ja müügisumma müügisumma kategooriate kaupa
-- Müügisumma kategooria, müükide arv, müügisumma
SELECT sale_category, COUNT(*) AS sales_per_category, SUM(sale_sum) AS sale_sum_category
FROM sales_table
GROUP BY sale_category;

-- Alternatiivne lahendus AJUTISE tabeli (päringu) abil
WITH sales_per_category AS (
SELECT *, 
CASE 
	WHEN sale_sum < 250 THEN 'Small Sale'
	WHEN sale_sum >= 250 AND sale_sum <= 500 THEN 'Medium Sale'
	WHEN sale_sum >= 500 THEN 'Large Sale'
	ELSE 'ERROR'
	END AS sale_category_new
FROM sales_table) 
SELECT sale_category_new, SUM(sale_sum), COUNT(*)
FROM sales_per_category 
GROUP BY sale_category_new;


-- Mida veel võiks leida?
SELECT * 
FROM sales_table st;


-- Leia müügisummad regioonide kaupa – regiooni ID ja müügisumma
SELECT region_id, 
ROUND(SUM(sale_sum),0) AS sale_sum_region
FROM sales_table 
GROUP BY region_id 
ORDER BY sale_sum_region DESC;

-- Keskmine allahindlus ja keskmine hind toote põhiselt
-- et oleks GROUP BY loogikast sõltumatuid tulpi, tuleb teha 'allpäring' SELECT sulgudes teisel real
SELECT product_id, 
COUNT(sale_sum) AS sale_number,
SUM(sale_sum) || '€' AS sale_sum,
ROUND(SUM(unit_price), 0) || '€' AS unit_price_sum,
ROUND(SUM(quantity), 0) AS total_quantity,
ROUND(MIN(unit_price * (1 - discount)), 0) || '€' AS min_price,
ROUND(MAX(unit_price * (1 - discount)), 0) || '€' AS max_price,
ROUND(AVG(unit_price * (1-discount)), 0) || '€' AS avg_discount_price
FROM sales_table
GROUP BY product_id
ORDER BY product_id ASC;
