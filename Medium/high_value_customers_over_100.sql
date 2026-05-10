-- Problem Statement:
-- The marketing team wants to identify high-value customers for a premium loyalty program.
-- Find all customers who have placed at least one order over $100.
-- Return:
-- - customer ID
-- - customer name

-- Pattern:
-- Semi-join (EXISTS) for filtering based on related table condition

-- Technique:
-- Use EXISTS to check if at least one matching order exists
-- with amount > 100 for each customer

-- Time complexity idea:
-- O(N * M) worst case, but optimized with indexing on customer_id

-- Solution:

SELECT
    customer_id,
    customer_name
FROM online_store_customers t1
WHERE EXISTS (
    SELECT 1
    FROM online_store_orders t2
    WHERE t1.customer_id = t2.customer_id
      AND t2.amount > 100
);
