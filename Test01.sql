--  How many rows are there in the transactions table?

select 
  count(*) as trans_rows_num
from
  grocery_db.transactions;
  
-- Return the customer_id for the customer who lives farthest from the store
select 
  customer_id,
  distance_from_store

from
    grocery_db.customer_details
    
where 
  distance_from_store is not null
    
order by 
  distance_from_store desc
  
limit 1;


    

-- Return the number of unique customers in the customer_details table, split by gender
select 
  gender,
  count(distinct customer_id) as customer_unique_num
  
from
  grocery_db.customer_details

group by
  gender

having
  gender in ('M','F');
  

-- What were the total sales for each product area name for July 2020. Return these in the order of
-- highest sales to lowest sales

select 
  p.product_area_name,
  sum(t.sales_cost) as total_sales
   
from
  grocery_db.transactions t
 inner join  grocery_db.product_areas p on t.product_area_id = p.product_area_id
 
where 
  --extract(year from t.transaction_date) = 2020 and
  --extract(month from t.transaction_date) = 7
  t.transaction_date between '2020-07-01' and '2020-07-31'
  
group by 
  p.product_area_name
  
order by 
  total_sales desc;
  

-- Return a list of all customer_id's that do NOT have a loyalty score (i.e. they are in the customer_details
-- table, but not in the loyalty_scores table)

select 
   distinct c.customer_id
  
from
  grocery_db.customer_details c
  left join grocery_db.loyalty_scores l on c.customer_id = l.customer_id
  
where 
  l.customer_loyalty_score is null
  
order by
  c.customer_id;
  


  

