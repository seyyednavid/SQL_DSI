-- TEMP TABLES & cte FOR MULTIPLE QUERIES
-- Goal: break a big task to smaller chunks

--Feature                 	Temporary Table	                        CTE (Common Table Expression)
--Scope               	Exists for the session         	         Exists only during query execution
--Storage	        Physically stored in tempdb (or similar)         	In-memory, logical result set
--Modification	         Can be modified (INSERT, UPDATE)                     Read-only


select * from grocery_db.transactions;
select * from grocery_db.transactions where customer_id = 1;


-- TEMPORARY TABLES
create temp table cust_transactions as (
select 
  customer_id,
  transaction_id,
  sum(sales_cost) as total_sales
  
from
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
);

select * from cust_transactions;


select 
  customer_id,
  avg(total_sales)as avg_transaction_sales
  
from 
  cust_transactions
  
group by 
  customer_id;
  

-- COMMON TABLE EXPRESSION
with cust_transactions_cte as (
select 
  customer_id,
  transaction_id,
  sum(sales_cost) as total_sales
  
from
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
),

cust_sales_cte as (
select 
  customer_id,
  avg(total_sales)as avg_transaction_sales
  
from 
  cust_transactions_cte
  
group by 
  customer_id
)
select max(avg_transaction_sales) as max_avg_sales from cust_sales_cte
;
  

-- CTE adv: everything happens in temporary memory 
-- dis: if there is error in any step the whole process does not run.


select * from grocery_db.transactions;

--------------------------------------------------------------------------------------- Test myself
-- temporary table
create temp table cust_unique_transaction as (
select 
  customer_id,
  transaction_id,
  sum(sales_cost) as total_cost_per_transaction

from 
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
);

select 
  customer_id,
  max(total_cost_per_transaction) as max_transaction_sales
  
from 
  cust_unique_transaction
  
group by 
  customer_id
  
order by
  customer_id;
  

-- CTE
with cust_unique_transaction_cte as (
select 
  customer_id,
  transaction_id,
  sum(sales_cost) as total_cost_per_transaction

from 
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
)

select 
  customer_id,
  max(total_cost_per_transaction) as max_transaction_sales
  
from 
  cust_unique_transaction_cte
  
group by 
  customer_id
  
order by
  customer_id;

