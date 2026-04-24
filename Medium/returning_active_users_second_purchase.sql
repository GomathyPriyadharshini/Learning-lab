-- Problem:
-- Identify returning active users by finding users who made a second purchase
-- within 1 to 7 days after their first purchase.
-- Ignore same-day purchases.
-- Output list of user_ids.

-- Pattern:
-- Window function (ROW_NUMBER) + conditional aggregation (pivoting)

-- Technique:
-- Assign row numbers per user to identify first and second purchase,
-- then compare their dates using DATEDIFF.

-- Time complexity idea:
-- O(n log n) due to sorting in window function (partition by user_id)

-- Solution:

WITH cte AS (
    SELECT 
        user_id,
        MAX(CASE WHEN rn = 1 THEN created_at END) AS first_date,
        MAX(CASE WHEN rn = 2 THEN created_at END) AS second_date
    FROM (
        SELECT 
            user_id,
            created_at,
            ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at) AS rn
        FROM amazon_transactions
    ) d
    WHERE rn <= 2
    GROUP BY user_id
)

SELECT user_id
FROM cte
WHERE second_date IS NOT NULL
  AND DATEDIFF(second_date, first_date) BETWEEN 1 AND 7
ORDER BY user_id;
