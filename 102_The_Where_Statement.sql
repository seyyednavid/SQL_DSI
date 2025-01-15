-- THE WHERE STATEMENT
select 
  *
  
from 
  grocery_db.customer_details
  
where
  distance_from_store < 2;
  

-- MULTIPLE CONDITION
select 
  *
  
from 
  grocery_db.customer_details
  
where
  distance_from_store < 2 and
  gender = 'M';
  

-- OR
select 
  *
  
from 
  grocery_db.customer_details
  
where
  distance_from_store < 2 or
  gender = 'M';
  
-- OTHER OPERATORS
/*
EQUAL TO =
NOT EQUAL TO <>
GREATER THAN/LESS THAN/EQUAL <  >  <=
*/
select
  *
  
from 
  grocery_db.campaign_data;
  
-- IN
select
  *
  
from 
  grocery_db.campaign_data
  
where
  mailer_type in ('Mailer1', 'Mailer2');


-- LIKE
select
  *
  
from 
  grocery_db.campaign_data
  
where
  mailer_type like '%Mailer%';
  
 -- You've been tasked with returning a list of customers who meet the following criteria:

    --Live less than or equal to 0.5 miles from the store
    --Have a value of 'M' or 'F' listed for their gender


    --Your query needs to return:

    --customer_id
    --distance_from_store
    --gender
    
select 
  customer_id, 
  distance_from_store, 
  gender
  
from 
  grocery_db.customer_details
 
where 
  distance_from_store <= 0.5 and
  gender in ('M', 'F');
  
  

  
