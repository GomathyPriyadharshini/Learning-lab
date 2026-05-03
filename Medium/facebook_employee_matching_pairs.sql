-- Problem:
-- Find matching pairs of Meta/Facebook employees such that they are:
-- - From the same nation
-- - Of different age
-- - Of the same gender
-- - At different seniority levels
-- Output ids of paired employees.

-- Pattern:
-- Self join with filtering conditions

-- Technique:
-- Join the table with itself and apply constraints on attributes.
-- Use an ordering condition (t1.id < t2.id) to avoid duplicate pairs.

-- Time complexity idea:
-- O(N^2) in worst case due to self join, but reduced by filtering conditions.

-- Solution:
SELECT 
    t1.id AS employee_1,
    t2.id AS employee_2
FROM facebook_employees t1
JOIN facebook_employees t2
    ON t1.location = t2.location
   AND t1.age <> t2.age
   AND t1.gender = t2.gender
   AND t1.is_senior <> t2.is_senior;
