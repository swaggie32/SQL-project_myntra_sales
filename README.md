👖 Myntra Fashion Apparel: Sales & Pricing Analysis
A beginner-friendly data analytics project exploring pricing strategies, discounts, customer ratings, and brand performance across 52,000+ fashion listings on Myntra. This project combines SQL for exploratory data analysis and Power BI for visual reporting.

📌 Project Overview
This project analyzes over 52,000 fashion denim and pant listings on Myntra to answer real-world business questions:

Which fashion brands dominate catalog volume?[cite: 1]

Do deeper discounts lead to higher customer engagement and reviews?[cite: 1]

What is the "sweet spot" price band where customer review volume and high ratings align?[cite: 1]

🛠️ Tools Used
Database / SQL: PostgreSQL / MySQL / SQL Server for schema creation, filtering, and data querying[cite: 1]

Business Intelligence: Power BI Desktop for KPI cards, bar charts, slicers, and interactive cross-filtering

Dataset: Scraped e-commerce catalog (myntra_dataset_ByScraping.csv)

📂 Project Structure
├── data/
│   └── myntra_dataset_ByScraping.csv     # Raw dataset (52,120 rows)
├── sql/
│   └── project_1_myntra_sales.sql        # Table creation & 10 business queries
├── images/
│   └── dashboard_preview.png             # Screenshot of the Power BI dashboard
├── Myntra_Sales_Dashboard.pbix           # Interactive Power BI file
└── README.md                             # Project documentation

📊 Dataset & Database Schema
The database table was defined and populated using the following DDL statement[cite: 1]:
SQL
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
