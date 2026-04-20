-- Problem:
-- Find all workers whose first name contains 6 letters
-- and ends with the letter 'h'.

-- Pattern: Filtering (String conditions)
-- Technique: LENGTH + LIKE
-- Time complexity idea: O(n)

SELECT *
FROM worker
WHERE LENGTH(first_name) = 6
  AND first_name LIKE '%h';
