# 📊 Myntra Apparel Market Intelligence & Pricing Strategy Dashboard

An end-to-end data analytics project exploring pricing strategies, discount distribution, customer rating patterns, and brand positioning across 52,000+ fashion apparel listings on Myntra.

![Dashboard Preview](Dataset-cover.png)

## 📌 Project Overview
- **Data Source**: Web-scraped e-commerce data containing 52,120 product listings across 417 brands.
- **Tech Stack**: SQL Server (Data Extraction & Verification), Power Query (ETL & Cleaning), Power BI (Data Modeling, DAX, Interactive UI).
- **Core Focus**: Brand catalog distribution, pricing elasticity, discount bands, and customer satisfaction metrics.

## 💡 Key Business Findings
1. **Catalog Domination**: The top 5 brands (WROGN, Flying Machine, United Colors of Benetton, Roadster, and Mufti) command over 37% of the total apparel listings.
2. **The ₹1,000 - ₹1,999 Sweet Spot**: More than 54% of products fall into this tier, balancing catalog breadth with steady demand.
3. **Discount vs. Popularity**: Products with deep discounts (>60%) generate 55% higher customer engagement (114 avg reviews vs 73 in the mid-discount tier), but see a slight drop in average rating (from 4.10 down to 3.91).
4. **Data Integrity Resolution**: Fixed a schema flaw in scraped discount percentages by engineering custom dynamic DAX measures from raw MRP and selling prices.

## 🛠️ Data Model & DAX Measures
- `Total Products` = `COUNTROWS(myntra_sales)`
- `Avg Discount %` = `DIVIDE(SUM(mrp) - SUM(price), SUM(mrp), 0)`
- `Avg Reviews Per Product` = `AVERAGE(myntra_sales[number_of_ratings])`

## 🚀 How to View
1. Download the `.pbix` file from this repository.
2. Open with [Power BI Desktop](https://powerbi.microsoft.com/desktop/).
