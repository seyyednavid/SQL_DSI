-- WINDOW FUNCTION
select
  *,
  sum(sales_cost) over (partition by transaction_id) as transaction_total_sales,
  (sales_cost * 100)/ sum(sales_cost) over (partition by transaction_id) as transaction_sales_percent
  
from 
  grocery_db.transactions;
  

-- ROW NUMBER AND RANK 
select 
  *,
  row_number() over (partition by customer_id order by transaction_date, transaction_id) as transaction_number
  
from
  grocery_db.transactions;



-- REFERENCE

-- Row number give a unique value to each row of data in the set *even* if there are ties in the order by logic
-- rank (1,2,3,4,5) =>(1,1,1,4,5) and dense_rank(1,2,3,4,5) => (1,1,1,2,3)

-- NTILE  -  for deciles/percentiles etc
select
  customer_id,
  customer_loyalty_score,
  ntile(3) over (order by customer_loyalty_score desc) as loyalty_category1,
  ntile(10) over (order by customer_loyalty_score desc) as loyalty_category2
  
from
  grocery_db.loyalty_scores;
  


  
-- Test myself

select 
  customer_id,
  gender,
  distance_from_store,
  rank() over (partition by gender order by distance_from_store) as distance_from_store_rank
  
from 
  grocery_db.customer_details

where 
  gender in ('M','F') and
  distance_from_store is not null;
