# 🍽️ SQL Project: Menu Performance and Customer Behavior Analysis

**Duration:** Q1 2023  
**Tools Used:** MySQL  
**Data Tables:** `menu_items`, `order_details`

---

## 🧠 Business Context

At the start of 2023, a restaurant introduced a new menu. After three months, the management wanted to analyze:

- Which items performed best and worst
- What categories customers favored
- What high-spending customers ordered most

This SQL project investigates item performance and customer behavior using transactional data from January to March.

---

## 🎯 Project Objectives

1. **Explore Menu Structure & Pricing**
2. **Analyze Order Volume & Item Frequency**
3. **Identify Customer Preferences & High-Spend Patterns**

---
## 📊 Key Findings

- **Most ordered item**: *Hamburger* – 622 orders  
- **Least ordered item**: *Chicken Tacos* – 123 orders  
- **Top spending order (ID 440)** bought 14 items (8 Italian)  
- **Italian category** had the highest average price: $16.75  
- **American items** were most affordable (avg. $10.06)  
- **5370 unique orders**, totaling **12,234 items** over Jan–Mar 2023
  
## 🛠️ Methodology

- Queried `menu_items` to assess pricing, categories, and count
- Queried `order_details` to explore volume, frequency, and dates
- Joined both tables to identify top/least ordered items and customer spend
- Used `GROUP BY`, `COUNT()`, `SUM()`, `JOIN`, and subqueries to extract insights

---

## 🧾 Example SQL Queries

```sql
-- Count the number of times each item was ordered
SELECT category, item_name, COUNT(*) AS num_orders
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY category, item_name
ORDER BY num_orders DESC;

-- Total Spend Per Order
SELECT od.order_id, SUM(mi.price) AS total_spend
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spend DESC
LIMIT 5;

-- Category Breakdown for High-Spend Order (ID 440)
SELECT category, COUNT(item_id) AS num_dishes
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- Find the average price of dishes in each category
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY avg_price DESC;

-- Count how many dishes exist in each food category
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category
ORDER BY num_dishes DESC;
```

## 📂 Repository Contents

| File | Description |
|------|-------------|
| [`README.md`](README.md) | Project overview, business context, key findings, and SQL highlights |
| [`queries.sql`](https://github.com/BonfaceMusyoka/sql-menu-performance-analysis/blob/main/queries.sql) | Full SQL code for all three objectives (menu, orders, customer behavior) |
| [`Restaurant Orders MySQL.zip`](https://github.com/BonfaceMusyoka/sql-menu-performance-analysis/raw/main/Restaurant%2BOrders%2BMySQL.zip) | 📦 Downloadable dataset (ZIP format) |


## 📈 Business Recommendations

- Promote top-performing items like **Hamburger** through bundles or upsell campaigns.
- Consider repositioning or rebranding **low-performing dishes** like Chicken Tacos.
- Leverage insights from **high-spending orders** to design meal combos, especially featuring Italian items.
- Invest in menu categories with **high customer preference** and **profit margin**, such as Italian and Asian.
- Monitor order patterns monthly to spot emerging customer trends.

