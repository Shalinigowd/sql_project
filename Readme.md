# 🛒 Zepto Inventory Data Analysis (PostgreSQL Project)

## 📌 Project Overview

This project focuses on analyzing a real-world **Zepto Inventory Dataset** using SQL in PostgreSQL.
The goal is to perform **data exploration, data cleaning, and business analysis** to extract meaningful insights from the dataset.

---

## 🧰 Tech Stack

* PostgreSQL
* SQL
* Kaggle Dataset

---

## 📂 Dataset Description

The dataset contains product-level inventory details such as:

* SKU ID
* Product Name
* Category
* MRP (Maximum Retail Price)
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Weight (grams)
* Stock Availability

---

## 🏗️ Database Schema

```sql
CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discount_persent NUMERIC(5,2),
    avaliable_quantity INTEGER,
    discounted_sellingprice NUMERIC(8,2),
    weight_in_gms INTEGER,
    outofstock BOOLEAN,
    quantity INTEGER
);
```

## 🔍 Data Exploration

### Total Records

* Count total number of rows in dataset

### Sample Data

* View first 10 rows

###  Missing Values Check

* Identified null values across all columns

###  Unique Categories

* Extracted distinct product categories

###  Stock Analysis

* Compared in-stock vs out-of-stock products

###  Duplicate Products

* Identified products appearing multiple times

---

##  Data Cleaning

* Removed products with zero price
* Converted price from **paise to rupees**
* Ensured data consistency across columns

---

## Business Insights & Analysis

### 1. Top 10 Best Value Products

* Based on highest discount percentage

### 2. Expensive Products Out of Stock

* Products with high MRP but unavailable

### 3. Revenue by Category

* Estimated revenue per category

###  4. Premium Products with Low Discount

* High MRP (>500) but low discount (<10%)

###  5. Top Categories by Average Discount

* Identified top 5 categories offering best discounts

###  6. Price per Gram Analysis

* Best value products based on weight pricing

###  7. Product Segmentation

* Classified products into:

  * LOW (<1kg)
  * MEDIUM (<5kg)
  * BULK (>5kg)

###  8. Total Inventory Weight

* Calculated total stock weight per category

---

## Key Insights

* Certain categories offer significantly higher discounts
* Some high-value products are frequently out of stock
* Price-per-gram analysis reveals hidden value deals
* Bulk products contribute heavily to inventory weight

---

## Project Structure

```
zepto-sql-project/
│── dataset.csv
│── schema.sql
│── queries.sql
│── README.md
```

---

## How to Run

1. Create database in PostgreSQL
2. Create table using schema.sql
3. Import dataset (CSV)
4. Run queries.sql to perform analysis


## Future Enhancements

* Build Power BI dashboard
* Add advanced SQL queries (Window Functions)
* Create API using FastAPI
* Deploy project online


##  Conclusion

This project demonstrates strong SQL skills including:

* Data Cleaning
* Data Exploration
* Aggregations & Grouping
* Business Insight Generation


