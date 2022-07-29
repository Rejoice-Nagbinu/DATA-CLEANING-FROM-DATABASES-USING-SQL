### This are all the codes shown in my read.me file you can can copy them and try them using tables and columns from your own datasets 

-- no 1 using the accounts table in John&Johnson dataset to create first name and last name column from primary_poc 
 
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
       RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts; 


-- no 2 using the accounts table in John&Johnson dataset to create an email after for each primary_poc, using the first name, last, @company name.com 
 
 WITH t1 AS (
   SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
   FROM accounts)
 SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
 FROM t1; 

 -- no 3 here we'll use the second dataset from our database the SF_crime dataset to change the format of our date 
 -- firstly let's take a brief veiw at the dataset 

 SELECT * 
 FROM sf_crime_data 
 LIMIT 10; 

 -- secondly let's take a look at our at our date column 
 SELECT date 
 FROM sf_crime_data; 

-- thirdly let's check to seek if all the length of date is the same 
 SELECT length (date), min(length (date)), max(length (date)) 
 FROM sf_crime_data; 
 
-- lastly let's change the format of our date to the much more analysis ready format
 
 SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
 FROM sf_crime_data; 

-- no 4 here we'll use the account table from our first dataset john&Johnson to fill  null values, we'll use values of account_id to fill in the null values of the order.account_id

 SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
 FROM accounts a
 LEFT JOIN orders o
 ON a.id = o.account_id
 WHERE o.total IS NULL; 

-- no 5 here we'll use zero to replace the null values of the order.account_id we'll use the same code above, buh we'll change the replacing value to zero 

 SELECT COALESCE(o.id, 0) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, 0) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
 FROM accounts a
 LEFT JOIN orders o
 ON a.id = o.account_id
 WHERE o.total IS NULL
