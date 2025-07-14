SELECT * FROM walmart;


SELECT COUNT(*) FROM walmart;

SELECT DISTINCT payment_method FROM walmart;

SELECT COUNT(DISTINCT branch) FROM walmart;

SELECT MAX(quantity) FROM walmart;

--------------Business-Problem------------------

--Q1 Find the different payment methods and number of transactions, number of quantity sold
SELECT payment_method, COUNT(*) as no_of_payment_mthd, SUM(quantity) as no_of_qty_sold FROM walmart GROUP BY payment_method;

--Q2 Identify the highest rated category in each branch, display the branch, category, and the average rating
SELECT * FROM (SELECT branch, category, AVG(rating) as avg_rating, RANK() over(partition by BRANCH order by avg(rating) desc) as rank FROM walmart GROUP BY 1, 2) WHERE rank =1;;

--Q3 Identify the busiest day for each branch based on the number of transactions
SELECT date, TO_DATE(date, 'DD/MM/YY') AS formated_date FROM walmart;

SELECT date, TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name FROM walmart;

SELECT * FROM (SELECT branch, TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name, COUNT(*) as no_transactions, RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as rank FROM walmart GROUP BY 1, 2) WHERE rank = 1;

--Q4 Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.
SELECT payment_method, SUM(quantity) as no_of_qty_sold FROM walmart GROUP BY payment_method;

--Q5 Determine the average, minimum, and maximum rating of category for each city. list the city, average_rating, min_rating, max_rating.
SELECT city, category, MIN(rating) as min_rating, MAX(rating) as max_rating, AVG(rating) as avg_rating FROM walmart GROUP BY 1, 2;

--Q6 Calculate the total profit for each category by considering total_profit as
--(unit_price * quantity _profit_margin). List category and total_profit, ordered from highest to lowest profit.
SELECT category, SUM(total) as total_revenue, SUM(total * profit_margin) as profit FROM walmart GROUP BY 1;

--Q7 Determine the most common payment method for each Branch. Display Branch and the preferred_payment method.
WITH cte AS (SELECT branch, payment_method, COUNT(*) as total_transcation, RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as rank FROM walmart GROUP BY 1, 2) SELECT * FROM cte WHERE rank = 1;

--Q8 Categorize sales into 3 group MORNING, AFTERNOON, EVENING. Find out each shift and number of invoices.
SELECT *, time::time FROM walmart;

SELECT branch, CASE
	WHEN EXTRACT(HOUR FROM(time::time)) < 12 THEN 'Morning'
	WHEN EXTRACT(HOUR FROM(time::time)) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening'
END day_time,
COUNT(*)
FROM walmart
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

--Q9 Identify 5 branch with highest decrease ratio in revenue compare to last year(current year 2023 and last year 2022)

--revenue_decrease_ratio == last_year_revenure - current_year_revenue / last_year_revenue * 100
WITH revenue_2022
AS
(
	SELECT
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2022
	GROUP BY 1
),

revenue_2023
AS
(
	SELECT
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2023
	GROUP BY 1
)

SELECT 
	ls.branch,
	ls.revenue as last_year_revenue,
	cs.revenue as current_year_revenue,
	ROUND((ls.revenue - cs.revenue)::numeric/ls.revenue::numeric *100,2)
	AS revenue_decrease_ratio
FROM revenue_2022 as ls
JOIN revenue_2023 as cs
ON ls.branch = cs.branch
WHERE
	ls.revenue > cs.revenue
ORDER BY 4 DESC	
LIMIT 5;