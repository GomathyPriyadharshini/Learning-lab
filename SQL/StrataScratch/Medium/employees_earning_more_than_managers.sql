-- Problem:
-- Find employees who are earning more than their managers.
-- Output the employee's first name along with the corresponding salary.

-- Pattern:
-- Self join

-- Technique:
-- Join the employee table with itself:
-- - employee record as current employee
-- - another record as manager
-- Compare employee salary with manager salary.

-- Time complexity idea:
-- O(N) to O(N log N) depending on indexing on manager_id and id.

-- Solution:
SELECT 
    a.first_name,
    a.salary
FROM employee a
JOIN employee b
    ON a.manager_id = b.id
WHERE a.salary > b.salary;
