use restaurant_db;
-- view the order_details table
Select * from order_details;
-- find the date range of the order_details table (A range of 3 months from january to march)
select * from order_details order by order_date asc;-- earliest date is 2023-01-01
select * from order_details order by order_date desc;-- latest date is 2023-03-31

Select min(order_date) as earliest_date, max(order_date) as latest_date from order_details;
-- How many orders were made within this date range?
Select count(distinct order_id) as num_orders from order_details; -- a total of 5370 orders were made
-- how many items were ordered within this date range?
select count(*) from order_details; -- a total of 12234 items were ordered.
-- which orders had the most number of items?
Select order_id, count(item_id) as num_items from order_details group by order_id order by num_items desc limit 5;
-- How orders had more than 12 items? -- 20 orders had more than 12 items
Select count(*) from (Select order_id, count(item_id) as num_items 
from order_details 
group by order_id 
having count(item_id) > 12
order by num_items desc) as num_orders;





