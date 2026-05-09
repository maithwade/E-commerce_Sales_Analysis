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
-- Which city orders the most 
SELECT `ship-city`, COUNT(`Order ID`) AS Count
FROM amazon_sales_report
GROUP BY `ship-city`
ORDER BY Count DESC
LIMIT 1;

-- Which state orders the most 
SELECT `ship-state`, COUNT(`Order ID`) AS Count
FROM amazon_sales_report
GROUP BY `ship-state`
ORDER BY Count DESC
LIMIT 1;

-- Which states prefer B2B or regular orders
SELECT `ship-state`, B2B, COUNT(`Order ID`) AS Count
FROM amazon_sales_report
WHERE B2B = 'True'
GROUP BY `ship-state`, B2B
ORDER BY Count DESC
LIMIT 5;

-- Order Status Analysis
-- What % of orders were cancelled?
SELECT COUNT(`Order ID`) AS total_orders,
	SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders, 
    ROUND((SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(`Order ID`)) * 100, 2) AS percentage
FROM amazon_sales_report;

-- Which fulfilment method has the most cancellations?
SELECT fulfilment, COUNT(Status) AS Count
FROM amazon_sales_report
WHERE Status = 'Cancelled'
GROUP BY fulfilment
ORDER BY Count DESC
LIMIT 1;

-- Shipping Analysis
-- Which courier status is most common?
SELECT `Courier Status`, COUNT(`Courier Status`) AS Count
FROM amazon_sales_report
GROUP BY `Courier Status`
ORDER BY COUNT DESC;

-- Standard VS Expedited Shipping?
SELECT `ship-service-level`, COUNT(`ship-service-level`) AS Count
FROM amazon_sales_report
GROUP BY `ship-service-level`
ORDER BY Count DESC;

-- Revenue Analysis 
-- Average Order Value Per category
SELECT Category, ROUND(AVG(Amount), 2) AS avg_amt
FROM amazon_sales_report
GROUP BY Category;

-- category having the highest average sale amount
SELECT Category, ROUND(AVG(Amount), 2) AS avg_amt
FROM amazon_sales_report
GROUP BY Category
HAVING avg_amt > 500;

SELECT COUNT(*) FROM amazon_sales_report
WHERE Date IS NOT NULL;

SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%m-%d-%y'), '%Y-%m-%d') AS Date,
    `Order ID`,
    Status,
    Fulfilment,
    `Sales Channel`,
    `ship-service-level`,
    Style,
    SKU,
    Category,
    Size,
    ASIN,
    `Courier Status`,
    Qty,
    currency,
    Amount,
    `ship-city`,
    `ship-state`,
    `ship-postal-code`,
    `ship-country`,
    `promotion-ids`,
    B2B,
    `fulfilled-by`
FROM amazon_sales_report;