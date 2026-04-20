-- Problem:
-- Count total violations at 'Roxanne Cafe' for each year
-- based on inspection date.

-- Pattern: Aggregation (Group By + Filtering)
-- Technique: YEAR() + COUNT + GROUP BY
-- Time complexity idea: O(n)

SELECT YEAR(inspection_date) AS inspection_year,
       COUNT(violation_id) AS n_violations
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY YEAR(inspection_date)
ORDER BY inspection_year;
