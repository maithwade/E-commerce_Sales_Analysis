USE amazon_sales;
-- understanding how many total rows (sales records) we have in the dataset
SELECT COUNT(*) FROM `amazon sale report`;

-- Changed the table name
RENAME TABLE `amazon sale report` TO amazon_sales_report;

-- First 10 rows
SELECT * FROM amazon_sales_report
LIMIT 10;

-- total revenue generated across all sales
SELECT SUM(AMOUNT) AS total_revenue
FROM amazon_sales_report;

-- average sales amount
SELECT AVG(Amount) AS avg_sales_amount
FROM amazon_sales_report;

-- unique skus
SELECT COUNT(distinct SKU)
FROM amazon_sales_report;

-- B2B vs Non-B2B sales
SELECT B2B, COUNT(B2B) AS Count
FROM amazon_sales_report
GROUP BY B2B;

-- Most used fulfillment method
SELECT Fulfilment, COUNT(Fulfilment) AS Count
FROM amazon_sales_report
GROUP BY fulfilment
ORDER BY Count DESC;

-- sales by product size
SELECT Size, COUNT(Size) AS Count
FROM amazon_sales_report
GROUP BY Size
ORDER BY Count DESC;

-- Top 5 most sold SKUs
SELECT SKU, SUM(Qty) AS most_sold
FROM amazon_sales_report
GROUP BY SKU
ORDER BY most_sold DESC
LIMIT 5;

-- which category had the highest quantity sold?
SELECT Category, SUM(Qty) AS quantity_sold
FROM amazon_sales_report
GROUP BY Category
ORDER BY quantity_sold DESC;

-- Which month had highest revenue
SELECT MONTH(STR_TO_DATE(Date, '%m-%d-%y')) AS Month, SUM(Amount) AS revenue
FROM amazon_sales_report
GROUP BY Month
ORDER BY revenue DESC;

-- Deeper Product Analysis
-- Category generating most revenue
SELECT Category, ROUND(SUM(Amount), 2) AS revenue
FROM amazon_sales_report
GROUP BY Category
ORDER BY revenue DESC
LIMIT 1;

-- Most Cancelled SKUs
SELECT SKU, COUNT(SKU) AS Count
FROM amazon_sales_report
WHERE Status = 'Cancelled'
GROUP BY SKU
ORDER BY Count DESC
LIMIT 10;

-- Style performing best by revenue
SELECT Style, ROUND(SUM(Amount)) AS Revenue
FROM amazon_sales_report
GROUP BY Style
ORDER BY Revenue DESC
LIMIT 1;

-- GEOGRAPHIC ANALYSIS
-- 