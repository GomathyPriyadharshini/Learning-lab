-- Problem Statement:
-- Find the processed rate of tickets for each type.
-- The processed rate is defined as:
-- number of processed tickets / total number of tickets for that type
-- Round the result to 2 decimal places.

-- Pattern:
-- Aggregation with conditional counting

-- Technique:
-- Use SUM with boolean condition (processed = 1)
-- divided by COUNT(*), grouped by type

-- Time complexity idea:
-- O(N)
-- where N is the number of rows in facebook_complaints

-- Solution:

SELECT
    type,
    ROUND(SUM(processed = 1) / COUNT(*), 2) AS processed_rate
FROM facebook_complaints
GROUP BY type;
