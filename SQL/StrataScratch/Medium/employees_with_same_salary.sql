-- Problem:
-- Find employees who earn the same salary.
-- Output worker_id, first_name, and salary.
-- Order results by salary in descending order.

-- Pattern:
-- Window function + aggregation filter

-- Technique:
-- Rank salaries and identify salaries appearing more than once.
-- Return employees whose salary belongs to duplicate salary groups.

-- Time complexity idea:
-- O(N log N) due to sorting and grouping.

-- Solution:
WITH t1 AS (
    SELECT 
        worker_id,
        first_name,
        salary,
        RANK() OVER (ORDER BY salary) AS rnk
    FROM worker
)

SELECT 
    worker_id,
    first_name,
    salary
FROM t1
WHERE rnk IN (
    SELECT rnk
    FROM t1
    GROUP BY salary
    HAVING COUNT(*) > 1
)
ORDER BY salary DESC;
