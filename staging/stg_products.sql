CREATE TABLE stg_products AS
SELECT
    productcode AS product_code,
    name AS product_name,
    TRIM(REPLACE("cost£"::TEXT, '£', ''))::DECIMAL(10,2) AS cost,
    
    CASE
        WHEN LOWER(TRIM(avail)) IN ('yes', 'y') THEN TRUE
        WHEN LOWER(TRIM(avail)) IN ('no', 'n') THEN FALSE
        ELSE NULL
    END AS is_available,
    CASE 
        WHEN avail IS NULL THEN TRUE
        WHEN LOWER(TRIM(avail)) NOT IN ('yes', 'y', 'no', 'n') THEN TRUE
    ELSE FALSE
    END AS avail_needs_review


FROM products_dirty;
