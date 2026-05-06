-- Problem:
-- Find the employee with the highest salary per department.
-- Output department name, employee's first name, and salary.
-- Include all employees tied for highest salary within each department.

-- Pattern:
-- Window function (RANK with partition)

-- Technique:
-- Use RANK() partitioned by department and ordered by salary descending.
-- Filter rows where rank = 1 to get top earners per department.

-- Time complexity idea:
-- O(N log N) due to sorting within partitions.

-- Solution:
SELECT 
    department,
    first_name,
    salary
FROM (
    SELECT 
        department,
        first_name,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk = 1;
