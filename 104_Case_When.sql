-- CASE WHEN
select
  customer_id,
  customer_loyalty_score,
  -- case when customer_loyalty_score > 0.5 then 1 else 0 end as high_loyal_flag
  case when customer_loyalty_score > 0.5 then 'High Loyal' else 'Low Royal' end as high_loyal_flag
  
from
  grocery_db.loyalty_scores;



-- MULTIPLE CONDITIONS
select
  customer_id,
  customer_loyalty_score,
  -- case when customer_loyalty_score > 0.5 then 1 else 0 end as high_loyal_flag
  case 
    when customer_loyalty_score > 0.66 then 'High Loyal'
    when customer_loyalty_score > 0.33 then 'Medium Loyal'
    else 'Low Royal' end as loyalty_category 
  
from
  grocery_db.loyalty_scores;



-- CASE WHEN + AGGREGATION
select 
  customer_id,
  sum(case when product_area_id = 1 then sales_cost else 0 end) as non_food_sales,
  sum(case when product_area_id = 2 then sales_cost else 0 end) as vegs_sales,
  sum(case when product_area_id = 3 then sales_cost else 0 end) as fruit_sales,
  sum(case when product_area_id = 4 then sales_cost else 0 end) as dairy_sales,
  sum(case when product_area_id = 5 then sales_cost else 0 end) as meat_sales
  
from
  grocery_db.transactions

group by
  customer_id
  
order by 
  customer_id;
  


-- Exercise
select
  customer_id,
  distance_from_store,
  case
  when distance_from_store < 1 then 'close'
  when distance_from_store < 2.5 then 'medium'
  else  'far' end as distance_from_store_category
  
from
  grocery_db.customer_details
  
where 
  distance_from_store is not null;
  






  
