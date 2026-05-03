-- Problem:
-- Find the percentage of shipable orders.
-- Consider an order is shipable if the customer's address is known.

-- Pattern:
-- Aggregation with conditional counting

-- Technique:
-- Join orders with customers, then use conditional aggregation
-- to count shipable orders (non-null address) and divide by total orders.
-- Multiply by 100 to get percentage.
-- Cast to float to avoid integer division.

-- Time complexity idea:
-- O(N), where N is the number of joined rows between orders and customers.

-- Solution:
SELECT 
    100.0 * SUM(CASE WHEN c.address IS NOT NULL THEN 1 ELSE 0 END) 
          / COUNT(*) AS percent_shipable
FROM orders o
JOIN customers c
    ON o.cust_id = c.id;
