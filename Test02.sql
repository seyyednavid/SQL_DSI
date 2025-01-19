-- How many unique transactions are there in the transactions table?

select 
  count(distinct transaction_id)as unique_trans
from
  grocery_db.transactions; 
  
-- How many customers were in each mailer_type category for the delivery club campaign

select 
  mailer_type,
  count(distinct customer_id) as count_customer
  
from 
  grocery_db.campaign_data
  
where 
  campaign_name = 'delivery_club'
  
group by
  mailer_type
  
order by 
  count_customer desc;
  


-- Return a list of customers who spent more than $500 and had 5 or more unique transactions in the
-- month of August 2020
select 
  customer_id,
  sum(sales_cost) as customer_total_cost,
  count(distinct transaction_id) as total_trans
  
from 
  grocery_db.transactions
  
where 
  transaction_date between '2020-08-01' and '2020-08-31'
   
group by 
  customer_id
  
having
  sum(sales_cost) > 500 and
  count(distinct transaction_id) >= 5
  
order by 
  customer_id;
  


-- Return a list of duplicate credit scores that exist in the customer_details table


select 
  credit_score,
  count(credit_score) as reps_credit_score
  
from 
  grocery_db.customer_details
  
where 
  credit_score is not null
  
group by 
  credit_score
  
having 
  reps_credit_score > 1;

  


-- Return the customer_id(s) for the customer(s) who has/have the 2nd highest credit score. Make sure
-- your code would work for the Nth highest credit score as well
  
with rankedCredit as (
select 
  customer_id,
  credit_score,
  dense_rank() over (order by credit_score desc) as credit_score_rank
  
from 
  grocery_db.customer_details
  
where 
  credit_score is not null
)
 
select 
  customer_id
  
from
   rankedCredit
   
where
  credit_score_rank = 2;
   

  









