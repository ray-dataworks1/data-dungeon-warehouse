CREATE TABLE stg_customers AS
SELECT
    custID AS customer_id,
  -- clean name first
  INITCAP(SPLIT_PART(TRIM(REGEXP_REPLACE(LOWER(customer_name), 
      '^(mr|ms|mrs|miss|dr|prof)\.?\s+|(\s+(jr|sr|ii|iii|dds|phd|md|msc|mres|mphil|mbbs))$',
      '',
      'gi')), ' ', 1)) AS first_name,

  INITCAP(SPLIT_PART(TRIM(REGEXP_REPLACE(LOWER(customer_name), 
      '^(mr|ms|mrs|miss|dr|prof)\.?\s+|(\s+(jr|sr|ii|iii|dds|phd|md|msc|mres|mphil|mbbs))$',
      '',
      'gi')), ' ', 2)) AS last_name
    
    -- Clean email
    LOWER(TRIM(emailAddress)) AS email_address,
    
    -- Convert string to date
    JoinDate::DATE AS join_date,
    
    -- Convert is_actv to boolean
    CASE
        WHEN is_actv IN ('Y', 'y', 'yes', 'YES') THEN TRUE
        WHEN is_actv IN ('N', 'n', 'no', 'NO') THEN FALSE
        ELSE NULL
    END AS is_active,
    
    -- Standardize customer_type to lower-case and trim spaces
    CASE
        WHEN LOWER(TRIM(CustTYPE)) IN ('retail') THEN 'retail'
        WHEN LOWER(TRIM(CustTYPE)) IN ('wholesale') THEN 'wholesale'
        ELSE NULL
    END AS customer_type
    
FROM customers_dirty;
