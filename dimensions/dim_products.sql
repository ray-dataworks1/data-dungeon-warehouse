
-- This SQL script creates the dim_products table and populates it with product data from the staging table stg_products.

CREATE TABLE dim_products (
	product_code CHAR(4) PRIMARY KEY CHECK (product_code ~ '^[A-Z0-9]{4}$'),
	product_name TEXT,
	cost DECIMAL(10,2) CHECK(cost > 0),
	is_available BOOLEAN,
	avail_needs_review BOOLEAN,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- Added  created and updated timestamp columns to track changes over time for auditing purposes

INSERT INTO dim_products (product_code, product_name, cost, is_available, avail_needs_review)
SELECT
	product_code,
	product_name,
	cost,
	is_available,
	avail_needs_review
FROM stg_products;