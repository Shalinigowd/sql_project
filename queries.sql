-- =====================================================
-- ZEPTO INVENTORY DATA ANALYSIS - SQL QUERIES
-- =====================================================

-- =========================
--  DATA EXPLORATION
-- =========================

-- 1. Total number of records
SELECT COUNT(*) AS total_records 
FROM zepto;

-- 2. View sample data
SELECT * 
FROM zepto 
LIMIT 10;

-- 3. Check for NULL values
SELECT * 
FROM zepto
WHERE name IS NULL 
   OR category IS NULL 
   OR mrp IS NULL 
   OR discount_persent IS NULL 
   OR avaliable_quantity IS NULL 
   OR discounted_sellingprice IS NULL 
   OR weight_in_gms IS NULL
   OR outofstock IS NULL
   OR quantity IS NULL;

-- 4. Unique product categories
SELECT DISTINCT category 
FROM zepto 
ORDER BY category;

-- 5. Products in stock vs out of stock
SELECT outofstock, COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outofstock;

-- 6. Duplicate product names (multiple SKUs)
SELECT name, COUNT(sku_id) AS number_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY number_of_skus DESC;


-- =========================
-- DATA CLEANING
-- =========================

-- 7. Find products with invalid price
SELECT * 
FROM zepto
WHERE mrp = 0 OR discounted_sellingprice = 0;

-- 8. Delete invalid records (mrp = 0)
DELETE FROM zepto
WHERE mrp = 0;

-- 9. Convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discounted_sellingprice = discounted_sellingprice / 100.0;

-- 10. Verify updated prices
SELECT mrp, discounted_sellingprice 
FROM zepto;


-- =========================
-- BUSINESS ANALYSIS
-- =========================

-- 11. Top 10 best value products (highest discount)
SELECT name, mrp, discount_persent
FROM zepto
ORDER BY discount_persent DESC
LIMIT 10;

-- 12. High MRP products that are out of stock
SELECT name, mrp
FROM zepto 
WHERE outofstock = TRUE 
  AND mrp > 300
ORDER BY mrp DESC;

-- 13. Estimated revenue per category
SELECT category,
       SUM(discounted_sellingprice * avaliable_quantity) AS total_revenue
FROM zepto 
GROUP BY category
ORDER BY total_revenue DESC;

-- 14. Premium products with low discount
SELECT name, mrp, discount_persent
FROM zepto
WHERE mrp > 500 
  AND discount_persent < 10
ORDER BY mrp DESC, discount_persent DESC;

-- 15. Top 5 categories with highest average discount
SELECT category,
       AVG(discount_persent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- 16. Price per gram (best value products)
SELECT name,
       discounted_sellingprice,
       weight_in_gms,
       ROUND(discounted_sellingprice / weight_in_gms, 2) AS price_per_gram
FROM zepto
WHERE weight_in_gms >= 100
ORDER BY price_per_gram ASC;

-- 17. Product weight classification
SELECT name,
       weight_in_gms,
       CASE 
           WHEN weight_in_gms < 1000 THEN 'LOW'
           WHEN weight_in_gms < 5000 THEN 'MEDIUM'
           ELSE 'BULK'
       END AS weight_category
FROM zepto;

-- 18. Total inventory weight per category
SELECT category,
       SUM(weight_in_gms * avaliable_quantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;

