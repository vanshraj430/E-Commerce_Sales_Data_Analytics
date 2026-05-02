select * from customers;
select * from order_items;
select * from orders;
select * from products;

select * from orders where customer_id is null;   --no null values--

select order_id,count(*) from orders group by order_id having count(*)>1;     --no dulicate values found--

--what is the total revenue?--
select sum(price)  as  revenue 
from order_items;   


--what are the top 10 products based on the revenue?--
select product_id,sum(price) as revenue 
from order_items 
group by product_id order by revenue desc limit 10;


-- what are the 3 products which have the least revenue?--
select product_id,sum(price) as revenue from order_items group by product_id order by revenue  limit 3;   


-- which cities have oreded the most times? list top 10.--
select c.customer_city,count(o.order_id) as total_products 
from customers c join orders o on c.customer_id=o.customer_id 
group by c.customer_city order by total_products  desc limit 10 ;



--What is the average price per order?--
select avg(price) as average_price 
from order_items ;


--How many orders does each customer place, and who are the most frequent buyers?--
select count(order_id),customer_id 
from orders group by customer_id order by count(order_id) desc;


--which cities genarte the highest revenue.Give top 15 cities--
select c.customer_city,sum(oi.price) as revenue 
from customers c join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
group by c.customer_city order by revenue desc limit 15;


--How many orders were delivered after the estimated delivery date?--
select count(*) as late_deliveries from orders 
where order_delivered_customer_date > order_estimated_delivery_date;


--Which orders generated the highest revenue?--
select order_id,sum(price) as revenue from order_items 
group by order_id order by revenue desc;


--list of top 10 products with highest revenue--
select p.product_name,count(oi.price) as revenue 
from products p join order_items oi on p.product_id=oi.product_id
group by product_name order by revenue desc limit 10;

