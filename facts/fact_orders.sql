-- This SQL script populates the fact_orders table from the staging table stg_orders.
-- It includes foreign key constraints to ensure referential integrity with the dimension tables.
CREATE TABLE fact_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_code CHAR(4) NOT NULL,
    order_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    qty INTEGER CHECK (qty > 0),
    order_status TEXT,
    order_status_id INTEGER,

    -- Foreign key constraints
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES dim_customers(id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_code) REFERENCES dim_products(product_code),
    CONSTRAINT fk_order_status
        FOREIGN KEY (order_status_id) REFERENCES dim_order_status(order_status_id)
);

INSERT INTO fact_orders (customer_id, product_code, order_date, qty, order_status, order_status_id)
SELECT 
    customer_id,
    product_code,
    order_date,
    qty,
    order_status,
    order_status_id
FROM stg_orders;