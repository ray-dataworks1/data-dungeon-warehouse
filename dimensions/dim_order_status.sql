CREATE TABLE dim_order_status (
	order_status_id SMALLINT PRIMARY KEY, 
	is_processing BOOLEAN, 
	is_complete BOOLEAN, 
	is_cancelled BOOLEAN, 
	is_unknown BOOLEAN,
	-- Added a check constraint to dim_order_status to ensure every row represents a real tag and isn’t just an empty shell. 
	-- This prevents silent join failures in the fact model.
	CHECK (
		is_processing IS TRUE
	 OR is_complete IS TRUE
	 OR is_cancelled IS TRUE
	 OR is_unknown IS TRUE
	)
);

INSERT INTO dim_order_status (order_status_id, is_processing, is_complete, is_cancelled, is_unknown)
VALUES
    (1, TRUE,  FALSE, FALSE, FALSE), -- Processing
    (2, FALSE, TRUE,  FALSE, FALSE), -- Complete
    (3, FALSE, FALSE, TRUE,  FALSE), -- Cancelled
    (4, FALSE, FALSE, FALSE, TRUE);  -- Unknown / NULL


-- This dimensional model allows us to quickly filter statuses with:
-- WHERE dim_order_status.is_complete = TRUE
-- Join from fact_orders via order_status_id

-- Build a dictionary of mutually exclusive status flags (like a tag model)
