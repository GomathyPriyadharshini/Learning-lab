-- Problem:
-- Identify employee(s) working under manager_id = 13 who have achieved the highest target.
-- Return first name and target value.
-- Include all employees tied for the highest target.

-- Pattern:
-- Window function (ranking with filtering)

-- Technique:
-- Filter employees by manager_id = 13.
-- Use RANK() over target in descending order to handle ties.
-- Select employees where rank = 1.

-- Time complexity idea:
-- O(N log N) due to sorting for window function.

-- Solution:
SELECT 
    first_name,
    target
FROM (
    SELECT 
        first_name,
        target,
        RANK() OVER (ORDER BY target DESC) AS rn
    FROM salesforce_employees
    WHERE manager_id = 13
) t
WHERE rn = 1;
