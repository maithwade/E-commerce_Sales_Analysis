# 📦 Amazon Sales Data Analysis
 
## 📋 Project Overview
An end-to-end data analysis project using real-world Amazon India e-commerce sales data. This project demonstrates SQL data exploration and Tableau dashboard creation to uncover key business insights from 65,000+ sales records.
 
---
 
## 🛠️ Tools Used
- **MySQL** — Data storage and querying
- **MySQL Workbench** — SQL query execution
- **Tableau Desktop** — Data visualization and dashboard creation
---
 
## 📂 Dataset
- **Source:** [Amazon Sale Report — Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data)
- **Records:** 65,422 rows
- **Time Period:** March — May 2022
- **Fields:** Order ID, Date, Status, Fulfilment, Category, Size, SKU, Quantity, Amount, Ship City, Ship State, B2B, and more
---
 
## 🔍 SQL Analysis
 
### Key Questions Answered:
| # | Question | Result |
|---|---|---|
| 1 | Total sales records | 65,422 rows |
| 2 | Total revenue | ₹41,903,465 |
| 3 | Average order value | ₹640.51 |
| 4 | Unique SKUs sold | 6,380 |
| 5 | B2B vs Non-B2B orders | 467 B2B / 64,955 Regular |
| 6 | Most used fulfilment method | Amazon (43,974 orders) |
| 7 | Top city by orders | Bengaluru (6,003 orders) |
| 8 | Top state by orders | Maharashtra (11,399 orders) |
| 9 | Cancellation rate | 8.92% |
| 10 | Most cancelled SKU | JNE3405-KR-M (34 cancellations) |
| 11 | Top category by revenue | Set (₹21.3M) |
| 12 | Top category by quantity | Set (24,763 units) |
| 13 | Best performing style | J0230 (₹1,156,581) |
| 14 | Most used shipping level | Expedited (43,516 orders) |
| 15 | Month with highest revenue | April (₹28.7M) |
 
---
 
## 📊 SQL Concepts Used
- `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`
- `COUNT`, `SUM`, `AVG`, `ROUND`
- `GROUP BY`, `HAVING`
- `DISTINCT`
- `CASE WHEN`
- `STR_TO_DATE`, `MONTH`, `DATE_FORMAT`
- `RENAME TABLE`
---
 
## 📈 Tableau Dashboard
The dashboard includes 5 visualizations:
 
| Chart | Type | Insight |
|---|---|---|
| Revenue by Month | Line Chart | April peaks at ₹28.7M |
| Categories by Revenue | Bar Chart | Set dominates at ₹21.3M |
| Orders by State | Map | Maharashtra leads with 11,399 orders |
| B2B vs Non-B2B | Pie Chart | 99.3% regular orders |
| Fulfilment Method | Bar Chart | Amazon handles 67% of orders |
 
---
 
## 💡 Key Business Insights
1. **Set and Kurta** dominate both revenue and quantity — core product lines
2. **April** is the strongest sales month — peak season planning needed
3. **Maharashtra and Karnataka** are the top markets — focus marketing here
4. **Merchant fulfilment** has disproportionately high cancellation rates vs Amazon fulfilment
5. **Expedited shipping** is preferred by 2/3 of customers — speed matters!
6. **B2B is only 0.7%** of orders — predominantly a B2C business
---
 
## 🚀 How to Run
1. Download the dataset from Kaggle
2. Import CSV into MySQL using MySQL Workbench Table Import Wizard
3. Run queries from `queries/amazon_sales_analysis.sql`
4. Open dashboard file in Tableau
---
 
## 👩‍💻 Author
**Maithili Wade**  
