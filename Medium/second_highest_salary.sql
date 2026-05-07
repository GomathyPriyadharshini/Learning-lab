-- Problem:
-- Find the second highest salary of employees.

-- Pattern:
-- Window function (DENSE_RANK)

-- Technique:
-- Rank salaries in descending order using DENSE_RANK().
-- Filter for rank = 2 to get the second highest distinct salary.

-- Time complexity idea:
-- O(N log N) due to sorting for ranking.

-- Solution:
SELECT 
    salary
FROM (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk = 2;
