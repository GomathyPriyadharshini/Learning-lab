-- Problem:
-- Generate a list of employees who work in the HR department.
-- Output only first_name and department.
-- Each employee should appear twice in the result.

-- Pattern:
-- UNION ALL duplication

-- Technique:
-- Select HR employees twice and combine results using UNION ALL.
-- UNION ALL preserves duplicates.

-- Time complexity idea:
-- O(N), scanning HR employees twice.

-- Solution:
SELECT 
    first_name,
    department
FROM worker
WHERE department = 'HR'

UNION ALL

SELECT 
    first_name,
    department
FROM worker
WHERE department = 'HR';
