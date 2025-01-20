-- Return a list of customers from the loyalty_scores table who have a customer_loyalty_score of 0.77, 0.88, or 0.99

select 
  *
  
from
  grocery_db.loyalty_scores
  
where
  customer_loyalty_score in (0.77, 0.88, 0.99)

order by
  customer_id;
  
-- Return the average customer_loyalty_score for customers, split by gender
select 
  gender,
  avg(customer_loyalty_score) as avg_loyalty_score
  
from 
  grocery_db.customer_details c
  inner join grocery_db.loyalty_scores l on c.customer_id = l.customer_id
  
group by
  gender
  
order by
  avg_loyalty_score desc;
  

/*
 Return customer_id, distance_from_store, and a new column called distance_category that tags customers who are less than 1 mile from store as "Walking Distance",
 1 mile or more from store as "Driving Distance" and "Unknown" for customers where we do not know their distance from the store.
*/

select
  customer_id,
  distance_from_store,
  case
    when  distance_from_store < 1 then 'Walking Distance'
    when  distance_from_store >=1 then 'Driving Distance'
    else  'Unknown'  end as distance_category
    
from
  grocery_db.customer_details;
  

/*
 For the 400 customers with a customer_loyalty_score, divide them up into 10 deciles, and calculate the average
 distance_from_store for each decile
*/

create temp table loyalty_cat as(
select 
  customer_id,
  customer_loyalty_score,
  ntile(10) over (order by customer_loyalty_score) as loyalty_category
  
from
  grocery_db.loyalty_scores
);
  

select  
  l.loyalty_category,
  avg(distance_from_store) as avg_diastance

from 
  loyalty_cat l
  left join grocery_db.customer_details c on l.customer_id = c.customer_id
  
group by
  l.loyalty_category
  
order by
  l.loyalty_category;
  

/*
Return data showing, for each product_area_name - the
total sales, and the percentage of overall sales that each
product area makes up
*/

create temp table trans_temp as (
select 
  product_area_id,
  sum(sales_cost) as total_sales
  
from 
  grocery_db.transactions
  
group by
  product_area_id 
  
order by
  product_area_id 
); 
  

select * from trans_temp;
select
  p.product_area_name, 
  t.total_sales,
  round(t.total_sales / (select sum(total_sales) from trans_temp),2) as sales_percentage
 
from 
  trans_temp t
  inner join grocery_db.product_areas p on p.product_area_id = t.product_area_id
  
group by 
  p.product_area_name,
  t.total_sales
  
order by
  t.total_sales ;
  



















