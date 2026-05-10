-- Problem:
-- Make a report showing the number of survivors and non-survivors by passenger class.
--
-- Classes:
-- - First class  -> pclass = 1
-- - Second class -> pclass = 2
-- - Third class  -> pclass = 3
--
-- Output the number of survivors and non-survivors by each class.

-- Pattern:
-- Aggregation with conditional counting (pivot-style report)

-- Technique:
-- Group by survival status.
-- Use SUM(CASE WHEN ...) to count passengers in each class.

-- Time complexity idea:
-- O(N), single table scan with aggregation.

-- Solution:
SELECT 
    survived,
    SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
    SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
    SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived;
