# 👖 Myntra Fashion & Denim Analytics: Pricing, Ratings & Market Intelligence

An end-to-end exploratory data analysis and business intelligence project analyzing apparel pricing strategy, discount structures, customer ratings, and brand positioning across 52,000+ scraped listings on Myntra.

![Dashboard Preview](dataset-cover.png)

---

## 📌 Executive Summary

This project evaluates the relationship between catalog distribution, price points, and consumer engagement in fashion e-commerce. By combining SQL-driven data querying with an interactive Power BI dashboard, the analysis uncovers how top fashion brands balance volume, deep discounting, and product ratings to drive sales popularity.

---

## 📊 Dataset Overview

* **Source**: Scraped e-commerce catalog data (`myntra_dataset_ByScraping.csv`)
* **Total Records**: 52,120 rows
* **Unique Brands Analyzed**: 417 brands
* **Key Metrics**:
  * Total Catalog Volume: 52,120 products
  * Average Selling Price: ₹1,595
  * Average Discount Percentage: 50.6%
  * Average Customer Rating: 4.00 / 5.00
  * Total Accumulated Reviews: ~4.77 Million

### Data Schema
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `product_id` | Integer | Unique identifier for each product listing |
| `brand_name` | Text | Name of the apparel manufacturer/brand |
| `pants_description` | Text | Listing title and cut style (e.g., Slim, Straight, Relaxed) |
| `price` | Integer | Discounted final selling price in INR (₹) |
| `mrp` | Decimal | Maximum Retail Price before discounts in INR (₹) |
| `discount_percent` | Decimal | Raw scraped discount field |
| `ratings` | Decimal | Average consumer rating (1.0 to 5.0 scale) |
| `number_of_ratings` | Integer | Total volume of reviews submitted |

---

## 🔍 SQL Business Analysis

The exploratory analysis in `project_1_myntra_sales.sql` addresses several core commercial questions:

1. **Market Catalog Concentration**: Identified the dominant brands driving catalog depth (led by WROGN, Flying Machine, United Colors of Benetton, and Roadster).
2. **Price Elasticity & Rating Bands**: Evaluated product ratings across distinct price segments:
   * Under ₹500
   * ₹500 – ₹999
   * ₹1,000 – ₹1,999 (highest catalog concentration)
   * ₹2,000 – ₹2,999
   * ₹3,000+
3. **Discount Sensitivity vs. Engagement**: Investigated whether heavier discounts translate directly into higher review counts (surfacing an engagement surge in listings discounted over 60%).
4. **Value Proposition Leaders**: Calculated composite value rankings combining average price, discount depth, rating average, and review count among brands with substantial catalog presence ($\ge 20$ listings).

---

## 📈 Power BI Dashboard Highlights

* **Executive KPI Cards**: Instant summary metrics displaying total products, average selling price, average discount rate, average rating, and cumulative review volume.
* **Top 10 Brand Catalog Distribution**: Horizontal bar chart profiling volume leaders with clean direct data labels.
* **Price Tier vs. Engagement**: Clustered column chart tracking catalog density across budget brackets alongside consumer engagement levels.
* **Interactive Dynamic Slicers**: Multi-select filtering by brand and rating ranges to instantly isolate premium vs. budget label behavior across the entire canvas.

---

## 🛠️ Tech Stack & Tools

* **Data Extraction & Modeling**: SQL Server / PostgreSQL (Aggregations, Group By, Case Statements, Windowing)
* **ETL & Data Cleaning**: Power Query (Handling type consistency, schema correction, and custom calculated fields)
* **Visualization**: Power BI Desktop (Cards, Clustered Bar Visuals, Slicers, UI Design)

---

## 🚀 How to Run Locally

1. Clone or download this repository:
   ```bash
   git clone [https://github.com/YOUR-USERNAME/myntra-fashion-market-analytics.git](https://github.com/YOUR-USERNAME/myntra-fashion-market-analytics.git)
