-- Analyze customer behaviour
-- combine the menu_items table and order_details table into one table
Select * 
from order_details od
left join menu_items mi on od.item_id = mi.menu_item_id; 
-- what were the least and most ordered items? what categories were they in? -- most order- Hamburger(American =622 orders), least ordered- chicken Tacos (Mexican = 123 orders)
Select category,item_name, count(item_id) as num_orders 
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id
group by category,item_name
order by num_orders;
-- what were the top 5 orders that spend the most money
Select od.order_id, sum(mi.price) as total_spend
from order_details od join menu_items mi on od.item_id = mi.menu_item_id
group by od.order_id
order by total_spend desc
limit 5;
-- view the details of the highest spend order.14 items were ordered- Italian(8), Mexican(2), American(2), and Asian(2) 
Select * from order_details
where order_id = 440;

Select count(*) from order_details
where order_id = 440;

Select category, count(item_id) as num_dishes
from order_details od
join menu_items mi on od.item_id = mi.menu_item_id
where order_id = 440
group by category
order by num_dishes desc;

-- View the details of the top 5 orders
Select order_id, category, count(item_id) as num_dishes
from order_details od
join menu_items mi on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;
