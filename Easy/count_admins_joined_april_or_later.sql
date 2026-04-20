-- Problem:
-- Count number of employees in Admin department
-- who joined in April or later.

-- Pattern: Filtering + Aggregation
-- Technique: WHERE + COUNT
-- Time complexity idea: O(n)

SELECT COUNT(*) AS n_admins
FROM worker
WHERE department = 'Admin'
  AND MONTH(Joining_date) >= 4;
