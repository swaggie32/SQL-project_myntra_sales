# 👖 Myntra Fashion Apparel: Sales & Pricing Analysis

A beginner-friendly data analytics project exploring pricing strategies, discounts, customer ratings, and brand performance across 52,000+ fashion listings on Myntra. This project combines **SQL** for exploratory data analysis and **Power BI** for visual reporting.

![Dashboard Preview](.png)

---

## 📌 Project Overview

This project analyzes over 52,000 fashion denim and pant listings on Myntra to answer real-world business questions:
* Which fashion brands dominate catalog volume?[cite: 1]
* Do deeper discounts lead to higher customer engagement and reviews?[cite: 1]
* What is the "sweet spot" price band where customer review volume and high ratings align?[cite: 1]

---

## 🛠️ Tools Used

* **Database / SQL**: PostgreSQL / MySQL / SQL Server for schema creation, filtering, and data querying[cite: 1]
* **Business Intelligence**: Power BI Desktop for KPI cards, bar charts, slicers, and interactive cross-filtering
* **Dataset**: Scraped e-commerce catalog (`myntra_dataset_ByScraping.csv`)

---

## 📂 Project Structure

```text
├── data/
│   └── myntra_dataset_ByScraping.csv     # Raw dataset (52,120 rows)
├── sql/
│   └── project_1_myntra_sales.sql        # Table creation & 10 business queries
├── images/
│   └── dashboard_preview.png             # Screenshot of the Power BI dashboard
├── Myntra_Sales_Dashboard.pbix           # Interactive Power BI file
└── README.md                             # Project documentation
```

---

## 📊 Dataset & Database Schema

The database table was defined and populated using the following DDL statement[cite: 1]:

```sql
CREATE TABLE myntra_sales (
    product_id INT PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL,
    pants_description VARCHAR(100),
    price INT,
    mrp FLOAT,
    discount_percent FLOAT(50), 
    ratings FLOAT(50),
    number_of_ratings INT
);
```

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `product_id` | Integer | Unique identifier for each listing[cite: 1] |
| `brand_name` | Text | Fashion brand name[cite: 1] |
| `pants_description` | Text | Listing cut style and title[cite: 1] |
| `price` | Integer | Discounted selling price in INR (₹)[cite: 1] |
| `mrp` | Float | Maximum Retail Price before discounts in INR (₹)[cite: 1] |
| `discount_percent` | Float | Markdown percentage[cite: 1] |
| `ratings` | Float | Average product rating (1.0 to 5.0 scale)[cite: 1] |
| `number_of_ratings` | Integer | Total count of submitted customer reviews[cite: 1] |

---

## 🔍 SQL Business Questions, Queries & Findings

### 1. Which brands have the most products?[cite: 1]
```sql
SELECT
    brand_name,
    COUNT(product_id) AS total_products
FROM myntra_sales
GROUP BY brand_name
ORDER BY total_products DESC
LIMIT 10;
```
* **Finding:** The catalog is concentrated around fast-fashion powerhouses[cite: 1]. **WROGN** (5,303 products) and **Flying Machine** (5,197 products) hold the top spots, followed by **United Colors of Benetton** (3,985 products) and **Roadster** (3,523 products)[cite: 1].

---

### 2. Which brands have the highest average selling price?[cite: 1]
```sql
SELECT 
    brand_name,
    ROUND(AVG(price), 2) AS avg_price
FROM myntra_sales
GROUP BY brand_name
ORDER BY avg_price DESC;
```
* **Finding:** Premium luxury brands command the highest prices, led by **Jacob Cohen** (avg ₹33,142.50) and **Tramarossa** (avg ₹22,345.05).

---

### 3. Which brands offer the biggest discounts?[cite: 1]
```sql
SELECT 
    brand_name,
    ROUND(AVG(discount_percent)) AS avg_discount
FROM myntra_sales
GROUP BY brand_name
ORDER BY avg_discount DESC;
```
* **Finding:** Mass-market and streetwear labels provide aggressive markdown depth to accelerate customer acquisition, led by brands like **BEVDAAS**, **Red Tape**, and **L'monte**.

---

### 4. Which brands have the highest-rated products?[cite: 1]
```sql
SELECT 
    brand_name,
    AVG(ratings) AS avg_ratings
FROM myntra_sales
GROUP BY brand_name
HAVING COUNT(product_id) >= 20
ORDER BY avg_ratings DESC;
```
* **Finding:** Filtering for brands with statistical volume (≥ 20 listings) reveals that **French Connection** leads overall quality with an average rating of **4.36 / 5.00** across 421 listings[cite: 1].

---

### 5. Which products are the most popular?[cite: 1]
```sql
SELECT 
    product_id,
    brand_name,
    pants_description,
    price,
    ratings,
    number_of_ratings
FROM myntra_sales
ORDER BY number_of_ratings DESC;
```
* **Finding:** Everyday budget denim generates the greatest consumer engagement[cite: 1]. The top items include **Roadster Men Slim Fit Jeans** and **United Colors of Benetton Mid-Rise Jeans** priced at ₹579, each amassing more than **30,700 reviews**[cite: 1].

---

### 6. Does discount influence product popularity?[cite: 1]
```sql
SELECT 
    CASE
        WHEN discount_percent < 0.20 THEN 'Low discount'
        WHEN discount_percent < 0.40 THEN 'Medium discount'
        WHEN discount_percent < 0.60 THEN 'High discount'
        ELSE 'Very High Discount'
    END AS discount_category,
    COUNT(*) AS total_products,
    AVG(number_of_ratings) AS avg_ratings
FROM myntra_sales
GROUP BY discount_category
ORDER BY avg_ratings DESC;
```
* **Finding:** Higher discount tiers drive significantly more review volume[cite: 1]. Items in the **Very High Discount** bracket (>60% off) average **113 reviews**, compared to ~75–83 reviews for lower discount tiers[cite: 1].

---

### 7. Does price affect product ratings?[cite: 1]
```sql
SELECT 
    CASE
        WHEN price < 500 THEN 'Under 500'
        WHEN price < 1000 THEN '500-999'
        WHEN price < 2000 THEN '1000-1999'
        WHEN price < 3000 THEN '2000-2999'
        ELSE '3000+'
    END AS price_category,
    COUNT(*) AS total_products,
    AVG(ratings) AS avg_ratings,
    AVG(number_of_ratings) AS avg_number_of_ratings
FROM myntra_sales
GROUP BY price_category
ORDER BY price_category;
```
* **Finding:** The **₹1,000 – ₹1,999** bracket represents the market sweet spot, holding the highest catalog density (28,353 listings) and sustaining a strong **4.06★** rating[cite: 1]. In contrast, the cheapest bracket (₹500–₹999) records the lowest customer rating average (**3.84★**) despite high review counts[cite: 1].

---

### 8. Which products give customers the biggest discount?[cite: 1]
```sql
SELECT 
    product_id,
    brand_name,
    price,
    mrp,
    pants_description,
    discount_percent,
    mrp - price AS discount_amount
FROM myntra_sales
ORDER BY discount_amount DESC;
```
* **Finding:** Luxury designer apparel provides the largest rupee savings[cite: 1]. High-end items with an MRP of ₹65,500 provide raw savings of up to **₹26,200** per item[cite: 1].

---

### 9. Which brands have the highest discount value?[cite: 1]
```sql
SELECT 
    brand_name,
    AVG(mrp - price) AS avg_discount_amount
FROM myntra_sales
GROUP BY brand_name
ORDER BY avg_discount_amount DESC;
```
* **Finding:** Luxury fashion houses offer the highest absolute cash discounts, led by **Just Cavalli** (averaging ₹14,850 off per product) and **Jacob Cohen** (averaging ₹13,194 off).

---

### 10. Which brands have the best value proposition?[cite: 1]
```sql
SELECT 
    brand_name,
    ROUND(AVG(price), 2) AS avg_price,
    AVG(discount_percent) AS avg_discount_percent,
    AVG(ratings) AS avg_ratings,
    ROUND(AVG(number_of_ratings), 2) AS avg_number_of_ratings
FROM myntra_sales
GROUP BY brand_name
HAVING COUNT(*) >= 20
ORDER BY avg_ratings DESC;
```
* **Finding:** **French Connection** delivers the most balanced mix of quality and value—offering an average price of ₹1,357.37, healthy discount rates (~62%), and a class-leading **4.36★** rating across 421 items[cite: 1].

---

## 📈 Power BI Dashboard Highlights

* **KPI Scorecards**: Direct overview of Total Catalog Size (52,120), Average Selling Price (₹1,595), Average Rating (4.00★), and Cumulative Reviews (4.77M).
* **Top 10 Volume Leaders**: Clean horizontal bar chart comparing catalog share among top brands[cite: 1].
* **Price Tier Analysis**: Visual distribution of products across budget tiers versus review engagement[cite: 1].
* **Interactive Slicers**: Instant cross-filtering by brand name and rating ranges to observe individual brand behavior.

---

## 🚀 How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/YOUR-USERNAME/myntra-fashion-market-analytics.git](https://github.com/YOUR-USERNAME/myntra-fashion-market-analytics.git)
   ```
2. **Execute Database Script:**
   * Import `data/myntra_dataset_ByScraping.csv` into your SQL database.
   * Run the queries in `sql/project_1_myntra_sales.sql`[cite: 1].
3. **Open the Dashboard:**
   * Open `Myntra_Sales_Dashboard.pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/).
