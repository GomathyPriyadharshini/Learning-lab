-- Problem:
-- Identify returning active users who made a repeat purchase within 7 days
-- of their previous transaction. Ignore same-day purchases.
-- Output list of user_ids.

-- Pattern:
-- Window function (LAG) for consecutive event comparison

-- Technique:
-- Use LAG to get previous transaction date per user,
-- then calculate difference between consecutive purchases using DATEDIFF.

-- Time complexity idea:
-- O(n log n) due to sorting in window function (partition by user_id)

-- Solution:

WITH cte AS (
    SELECT 
        user_id,
        created_at,
        LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS prevdt
    FROM amazon_transactions
)

SELECT DISTINCT user_id
FROM cte
WHERE prevdt IS NOT NULL
  AND DATEDIFF(created_at, prevdt) BETWEEN 1 AND 7
ORDER BY user_id;
