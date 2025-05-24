CREATE TABLE stg_orders AS 
SELECT 
    ordernumber AS order_id,
    cust_id AS customer_id,
    prodcode AS product_code,
    orderdt AS order_date,
    qty,
    LOWER(TRIM(order_status)) AS order_status,
    -- Assigning an integer value to order_status for easier sorting and filtering
CASE 
    WHEN order_status = 'processing' THEN 1
    WHEN order_status = 'complete' THEN 2
    WHEN order_status = 'cancelled' THEN 3
    ELSE 4
END AS order_status_id
FROM orders_dirty;

