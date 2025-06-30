use restaurant_db;
-- Explore the menu_items table
select * from menu_items;

-- find the number of items in the menu (total of 32 items found)
select count(*) from menu_items;

-- what are the least and the most expensive items on the menu? 
select * from menu_items 
order by price; -- least expensive item(Endame-asian, costing 5 dollars)
select * from menu_items 
order by price desc; -- most expensive item ( shrimp scampi-italian, costing 19.95 dollars)

-- How many italian dishes are on the menu?
select count(*) from menu_items where category = 'Italian'; -- total of 9 items in the italian category

-- what are the least and most expensive italian dishes in the menu?
select * from menu_items where category = 'Italian' order by price; -- least expensive Itallian dish- spaghetti(14.50 dollars)
select * from menu_items where category = 'Italian' order by price desc; --  most expensive Itallian dish - shrimp scampi(19.95 dollars)

-- How many dishes are in each category
select category, count(menu_item_id) as num_dishes from menu_items group by category order by num_dishes;-- American (6), Asian (8), Mexican (9) and Italian (9).

-- What is the average dish price within each category
select category, avg(price) as avg_price from menu_items group by category order by avg_price desc; -- Italian(16.75), Asian (13.47), Mexican (11.80), American (10.06)

