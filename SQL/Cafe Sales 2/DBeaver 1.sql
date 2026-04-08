-- Analyze cafe sales and compare them to budget 
SELECT * 
FROM cafe_sales_cleaned csc;

-- 1.1. Cafe sales by Year-Month 
SELECT 
TO_CHAR(transaction_date, 'YYYY-MM') AS year_month,
ROUND(SUM(total_spent_calc), 0) || '€' AS total_sales
FROM cafe_sales_cleaned AS csc
GROUP BY year_month
ORDER BY year_month;

--------------- Alternatiiv kui vaja kuu ja aasta eraldada
SELECT 
EXTRACT(MONTH FROM transaction_date) AS month,
EXTRACT(YEAR FROM transaction_date) AS year,
ROUND(SUM(total_spent_calc), 0) || '€' AS total_sales
FROM cafe_sales_cleaned AS csc
GROUP BY year, month
ORDER BY month, year;

-- 1.2. Monthly sales vs monthly budget 
--eksportides võta euro märgid ära
SELECT 
TO_CHAR(transaction_date, 'YYYY-MM') AS year_month,
ROUND(SUM(total_spent_calc), 0) || '€' AS total_sales,
budget_sum || '€' AS total_budget
FROM cafe_sales_cleaned AS csc
LEFT JOIN cafe_budget AS cb 
ON TO_CHAR(transaction_date, 'YYYY-MM') = year_month 
GROUP BY TO_CHAR(transaction_date, 'YYYY-MM'), budget_sum
ORDER BY year_month;

SELECT 
TO_CHAR(transaction_date, 'YYYY-MM') AS year_month,
ROUND(SUM(total_spent_calc), 0) AS total_sales,
budget_sum AS total_budget
FROM cafe_sales_cleaned AS csc
LEFT JOIN cafe_budget AS cb 
ON TO_CHAR(transaction_date, 'YYYY-MM') = year_month 
GROUP BY TO_CHAR(transaction_date, 'YYYY-MM'), budget_sum
ORDER BY year_month;

-- 1.3. Cafe sales by item (KUI LISAN € MUUTUB TULBA SISU TÜÜP TEKSTIKS)
SELECT item_cleaned AS item,
ROUND(SUM(total_spent_calc), 0) || '€' AS sales_sum
FROM cafe_sales_cleaned AS csc
GROUP BY item_cleaned;

-- 1.4. Compare average sale sum per item to average sale sum for all items 
SELECT item_cleaned AS item,
ROUND(AVG(total_spent_calc), 2) AS avg_sales_sum_per_item,
(SELECT
ROUND(AVG(total_spent_calc), 2) AS avg_sales_sum
FROM cafe_sales_cleaned),
--- arvutame erinevuse
ROUND(AVG(total_spent_calc) - 
(SELECT 
AVG(total_spent_calc)
FROM cafe_sales_cleaned), 2) AS difference
FROM cafe_sales_cleaned 
GROUP BY item_cleaned;

select csc.item_cleaned ,round(avg(csc.total_spent_calc ),2) as avg_by_item,
(select round(AVG(csc.total_spent_calc ), 2) as avg_total_spent from cafe_sales_cleaned csc ),
round(avg(csc.total_spent_calc ) - (select AVG(csc2.total_spent_calc ) as avg_total_spent from cafe_sales_cleaned csc2 ), 2) as difference_from_avg_total
from cafe_sales_cleaned csc 
group by csc.item_cleaned ;


-- 1.5. Filter out only items where sales were more than 10 000
SELECT item_cleaned AS item, 
ROUND(SUM(total_spent_calc), 0) || '€' AS sales_sum
FROM cafe_sales_cleaned AS csc
GROUP BY item
HAVING SUM(total_spent_calc) > 10000
ORDER BY SUM(total_spent_calc) DESC;

-- 1.6. What were sales by payment method?
SELECT payment_method_cleaned,
ROUND(SUM(total_spent_calc), 0) AS sales_sum
FROM cafe_sales_cleaned AS csc
GROUP BY payment_method_cleaned
---lisame ka total numberi
UNION ALL
SELECT 'Total', SUM(total_spent_calc) AS Total
from cafe_sales_cleaned csc;

-- 1.7. Compare average sale sum by location to average sale sum
SELECT location_cleaned AS location,
ROUND(AVG(total_spent_calc), 2) AS avg_sales_sum_per_location,
(
SELECT
ROUND(AVG(total_spent_calc), 2) AS avg_sales_sum
FROM cafe_sales_cleaned)
FROM cafe_sales_cleaned AS csc
GROUP BY location_cleaned;

-- 1.8. What were sales by location?
SELECT csc.location_cleaned AS location,
ROUND(SUM(total_spent_calc), 0) || '€' AS sales_sum_per_location
FROM cafe_sales_cleaned AS csc
GROUP BY location_cleaned
ORDER BY sales_sum_per_location DESC;

-- 1.9. How many units per item were sold?
SELECT item_cleaned AS item,
SUM(quantity) AS units_sold_sum
FROM cafe_sales_cleaned AS csc
GROUP BY item_cleaned
ORDER BY item_cleaned ASC;

-- 1.10. Filter out only items where more than 3000 units were sold
SELECT item_cleaned AS item,
SUM(quantity) AS units_sold_sum
FROM cafe_sales_cleaned AS csc
GROUP BY item_cleaned
HAVING SUM(quantity) > 3000
ORDER BY item_cleaned ASC;