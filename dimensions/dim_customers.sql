-- This SQL script populates the dim_customers dimension table from the staging table stg_customers.
-- It includes transformations for customer type and flags for email review.
CREATE TABLE dim_customers (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email_address TEXT,
  join_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  customer_type TEXT CHECK (customer_type IN ('retail', 'wholesale', NULL)),
  email_review_needed BOOLEAN NOT NULL DEFAULT FALSE
);




INSERT INTO dim_customers (id, first_name, last_name, email_address, join_date, is_active, customer_type, email_review_needed)
SELECT customer_id,
       first_name,
       last_name,
       email_address,
       join_date,
       is_active,
       CASE 
           WHEN customer_type ILIKE 'retail' THEN 'retail'
           WHEN customer_type ILIKE 'wholesale' THEN 'wholesale'
           ELSE NULL
       END AS customer_type,
       email_review_needed
FROM stg_customers;


-- Emails with fewer than 3 characters before the @ or unusual character patterns have been flagged as email_review_needed. 
-- This field is metadata only and does not affect analysis.