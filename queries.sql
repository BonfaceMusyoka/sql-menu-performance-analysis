
-- ==============================================
-- OBJECTIVE 1: Explore the Menu Items Table
-- ==============================================

-- View the full menu
SELECT * FROM menu_items;

-- Count the number of items on the menu
SELECT COUNT(*) FROM menu_items;

-- Find the least and most expensive items
SELECT * FROM menu_items ORDER BY price ASC;  -- Least expensive item
SELECT * FROM menu_items ORDER BY price DESC; -- Most expensive item

-- Count the number of Italian dishes
SELECT COUNT(*) FROM menu_items WHERE category = 'Italian';

-- Least and most expensive Italian dishes
SELECT * FROM menu_items WHERE category = 'Italian' ORDER BY price ASC;
SELECT * FROM menu_items WHERE category = 'Italian' ORDER BY price DESC;

-- Count of dishes in each category
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category
ORDER BY num_dishes DESC;

-- Average dish price by category
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY avg_price DESC;


-- ==============================================
-- OBJECTIVE 2: Explore the Order Details Table
-- ==============================================

-- View all order details
SELECT * FROM order_details;

-- Earliest and latest order dates
SELECT MIN(order_date) AS earliest_date, MAX(order_date) AS latest_date FROM order_details;

-- Count of total orders
SELECT COUNT(DISTINCT order_id) AS num_orders FROM order_details;

-- Count of items ordered
SELECT COUNT(*) FROM order_details;

-- Orders with the most items
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC
LIMIT 5;

-- Count of orders with more than 12 items
SELECT COUNT(*) FROM (
    SELECT order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS large_orders;


-- ==============================================
-- OBJECTIVE 3: Analyze Customer Behavior via Combined Tables
-- ==============================================

-- Join order_details and menu_items
SELECT *
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id;

-- Least and most ordered items by category
SELECT category, item_name, COUNT(item_id) AS num_orders
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY category, item_name
ORDER BY num_orders DESC;

-- Top 5 orders by total spend
SELECT od.order_id, SUM(mi.price) AS total_spend
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spend DESC
LIMIT 5;

-- Items and categories in the highest spend order (order_id = 440)
SELECT * FROM order_details WHERE order_id = 440;
SELECT COUNT(*) FROM order_details WHERE order_id = 440;

SELECT category, COUNT(item_id) AS num_dishes
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
ORDER BY num_dishes DESC;

-- Category breakdown for top 5 spending orders
SELECT order_id, category, COUNT(item_id) AS num_dishes
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
