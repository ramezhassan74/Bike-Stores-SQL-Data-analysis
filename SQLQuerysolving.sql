--1-Which bike is most expensive? What could be the motive behind pricing this bike at the high price? 

SELECT*
FROM production.products
order by list_price desc;

select*
from production.brands

select*
from production.categories

SELECT*
FROM production.products
order by model_year desc;
---Trek Domane SLR 9 Disc - 2018
--Because it's Premium brand of bikes and it is Road bike with Pro Speed, Performance of SLR so it's using for Professional Races, and there is no bikes release in 2019.

--2-How many total customers does BikeStore have? Would you consider 
--people with order status 3 as customers substantiate your answer? 
select*
from sales.customers

select COUNT(customer_id)
from sales.customers

select*
from sales.orders

select COUNT(order_status)
from sales.orders
where order_status=2

--1445 actual Customers, because all of orders:1615, Confirmed orders 1445 = actual customers,
--415 Rejected, 62 Pending, 63 Processing so 1445 customers are actual had already bought orders from stores.

--3) How many stores does BikeStore have? 
select COUNT(store_id)
from sales.stores

--3 Stores

--4) What is the total price spent per order? 
select*
from sales.order_items

SELECT order_id,SUM(list_price * quantity * (1 - discount)) AS total_price_per_order
FROM sales.order_items
GROUP BY order_id;

--5) What’s the sales/revenue per store?
    SELECT 
    s.store_name, 
    SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_revenue
FROM 
    sales.stores s
JOIN 
    sales.orders o ON s.store_id = o.store_id
JOIN 
    sales.order_items oi ON o.order_id = oi.order_id
GROUP BY 
    s.store_name;

--Santa Cruz bikes = 1605823.0365
--Rowlet bikes = 867542.2436
--Baldwin bikes = 5215751.22775

--6)  Which category is most sold? 

select c.category_name,sum (q.quantity) as quantity_of_orders 
from production.categories c
join production.products p on c.category_id=p.category_id
join sales.order_items q on p.product_id=q.product_id
group by c.category_name
order by quantity_of_orders  desc;

--Cruisers bicycle 2063

--7) Which category rejected more orders? 

select c.category_name,count (os.order_status) as order_status_num
from production.categories c
join production.products p on c.category_id=p.category_id
join sales.order_items q on p.product_id=q.product_id
join sales.orders os on q.order_id=os.order_id
where os.order_status=3
group by c.category_name
order by order_status_num  desc

--Cruisers bikes = 41

--8) Which bike is the least sold? 
select n.product_name,sum (q.quantity) as quantity_of_orders
from production.products n
join production.products p on n.product_id=p.product_id
join sales.order_items q on p.product_id=q.product_id
group by n.product_name
order by quantity_of_orders  asc;

--Electra Amsterdam Royal 8i - 2017/2018

--9) What’s the full name of a customer with ID 259? 
select CONCAT(first_name, ' ', last_name) as full_name
from sales.customers
where customer_id=259

--Johnathan Velazquez

--10) What did the customer on question 9 buy and when? What’s the status of this order?

select CONCAT(n.first_name, ' ', n.last_name) as full_name,
o.order_date,o.order_status,p.product_name
from sales.customers n
join sales.orders o on n.customer_id=o.customer_id
join sales.order_items i on i.order_id=i.product_id
join production.products p on p.product_id=i.product_id
where n.customer_id=259

--All of orders applied In 1/1/2016
-- Wednesday Frameset - 2016
--Electra Cruiser 1 (24-Inch) - 2016
--Electra Girl's Hawaii 1 (16-inch) - 2015/2016
--Electra Girl's Hawaii 1 (20-inch) - 2015/2016



--11) Which staff processed the order of customer 259? And from which store? 

select CONCAT(n.first_name, ' ', n.last_name) as full_name,
CONCAT(s.first_name, ' ', s.last_name) as full_name,f.store_name
from sales.customers n
join sales.orders r on r.customer_id=n.customer_id
join sales.staffs s on r.staff_id=s.staff_id
join sales.stores f on s.store_id=f.store_id
where n.customer_id=259

--Johnathan Velazquez bought from Mierya Copeland in Santa Cruz Bikes store


--12) How many staff does BikeStore have? Who seems to be the lead Staff at BikeStore? 

select COUNT (staff_id) as total_staff
from sales.staffs 



select CONCAT(s.first_name, ' ', s.last_name) as full_name,(s.active),f.store_name
from sales.staffs s
join sales.stores f on s.store_id=f.store_id 
WHERE s.manager_id IS NULL;

--total staff 10, Manager Fabiola Jackson

--13) Which brand is the most liked? 

select b.brand_name,sum (q.quantity) as quantity_of_orders 
from production.brands b
join production.products p on b.brand_id=p.brand_id
join sales.order_items q on p.product_id=q.product_id
group by b.brand_name
order by quantity_of_orders  desc;

--Electra - 2612

--14) How many categories does BikeStore have, and which one is the least liked? 

select COUNT (category_id) AS total_categories
from production.categories

select c.category_name,sum (q.quantity) as quantity_of_orders 
from production.categories c
join production.products p on c.category_id=p.category_id
join sales.order_items q on p.product_id=q.product_id
group by c.category_name
order by quantity_of_orders  asc;

--7 Category, Electric bikes because 315

--15)  Which store still have more products of the most liked brand? 

SELECT s.store_name, b.brand_name, SUM(st.quantity) AS stock_quantity
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
JOIN production.stocks st ON p.product_id = st.product_id
JOIN sales.stores s ON st.store_id = s.store_id
WHERE b.brand_name = 'Electra' 
GROUP BY s.store_name, b.brand_name
ORDER BY stock_quantity DESC;

--Santa Cruz bikes 1715 stock

--16) Which state is doing better in terms of sales? 

select s.state,SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_revenue
from sales.stores s
join sales.orders r on s.store_id=r.store_id
join sales.order_items oi on r.order_id=oi.order_id
group by s.state
ORDER BY total_revenue DESC;

--NYC 5215751.2775

--17) What’s the discounted price of product id 259? 

select DISTINCT list_price, discount, (list_price * (1 - discount)) AS discounted_price
from sales.order_items
where product_id=259

--1199

--0.07 -> 1115.9

--0.20 -> 959.9

--18)  What’s the product name, quantity, price, category, model year and brand name of product number 44? 

select p.product_name,p.list_price,p.model_year,SUM(o.quantity) AS total_quantity,f.brand_name,v.category_name
from production.products p
join sales.order_items o on p.product_id=o.product_id
join production.brands f on p.brand_id=f.brand_id
join production.categories v on p.category_id=v.category_id
where p.product_id=44
group by p.product_name,p.list_price,p.model_year,f.brand_name,v.category_name

--Haro SR 1.1 - 2017, 539.99, 2017, 22, Haro, Mountain bikes

--19) What’s the zip code of CA?

select zip_code
from sales.stores
where state='CA'

--CA = 95060

--20) How many states does BikeStore operate in? 

SELECT COUNT(DISTINCT state) AS number_of_states
FROM sales.stores;

--3 States

--21) How many bikes under the children category were sold in the last 8 months? 

SELECT 
    SUM(oi.quantity) AS total_children_bikes_sold
FROM production.categories c
JOIN production.products p ON c.category_id = p.category_id
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
WHERE 
    c.category_name LIKE '%Children%' 
    AND o.order_date >= DATEADD(MONTH,-8,(SELECT MAX(order_date) FROM sales.orders) );

--18 bike

--22) What’s the shipped date for the order from customer 523 

select CONCAT(n.first_name, ' ', n.last_name) as full_name,o.order_id,o.shipped_date
from sales.customers n
join sales.orders o on n.customer_id=o.customer_id
where n.customer_id=523

--3 - 1 - 2016

--23) How many orders are still pending?

select COUNT(order_status) as pending_orders
from sales.orders
where order_status=1

--62 Pending orders

--24)What’s the names of category and brand does "Electra white water 3i - 2018" fall under? 

select f.brand_name,v.category_name
from production.products p
join production.brands f on p.brand_id=f.brand_id
join production.categories v on p.category_id=v.category_id
where p.product_name='Electra white water 3i - 2018'
group by f.brand_name,v.category_name


--Electra - Cruisers Byc.