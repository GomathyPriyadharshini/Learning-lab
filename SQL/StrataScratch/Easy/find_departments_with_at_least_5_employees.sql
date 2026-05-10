-- Problem:
-- Find departments with at least 5 employees.

-- Pattern: Aggregation (Group By + Filtering)
-- Technique: COUNT + HAVING
-- Time complexity idea: O(n)

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) >= 5;
