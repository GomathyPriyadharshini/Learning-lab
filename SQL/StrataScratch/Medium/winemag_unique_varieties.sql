-- Problem:
-- Find all possible varieties which occur in either of the winemag datasets.
-- Output unique variety values only.
-- Sort records based on the variety in ascending order.

-- Pattern:
-- Set operation (UNION)

-- Technique:
-- Use UNION to combine results from both tables while removing duplicates.
-- Then sort the final result in ascending order.

-- Time complexity idea:
-- O(N log N) due to sorting and deduplication.

-- Solution:
SELECT variety 
FROM winemag_p1

UNION

SELECT variety 
FROM winemag_p2

ORDER BY variety;
