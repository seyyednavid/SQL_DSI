-- THE SELECT STATEMENT
select
  *
  
from
  grocery_db.product_areas;
  

-- lIMIT
select
  *
  
from
  grocery_db.product_areas
  
limit 
  3;
  

-- ORDER BY
select
  *
  
from
  grocery_db.customer_details
  
order by
  distance_from_store,
  credit_score;
  

-- DISTINCT (Unique rows)
select
  distinct
  *
  
from
  grocery_db.customer_details
 -- 
select
  distinct
  gender
  
from
  grocery_db.customer_details
  

-- GIVING COLUMNS AN ALIAS
select
  distance_from_store as distance_to_store,
  customer_id as customer_number

from 
  grocery_db.customer_details;
  

-- CREATE NEW COLUMN
select
  distance_from_store as distance_to_store,
  customer_id as customer_number,
  1 as new_col,
  distance_from_store * 1.6 as distance_from_store_km
from 
  grocery_db.customer_details;
  
-- You've been tasked with returning a list of all unique credit_score values that exist in the customer_details table.
select 
  distinct credit_score
  
from 
  grocery_db.customer_details
