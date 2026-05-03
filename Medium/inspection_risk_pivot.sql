-- Problem:
-- Find the number of inspections that resulted in each risk category per each inspection type.
-- Consider the records with no risk category value belongs to a separate category.
-- Output the result along with the corresponding inspection type and the corresponding total number of inspections per that type.
-- The output should be pivoted, meaning that each risk category + total number should be a separate column.
-- Order the result based on the number of inspections per inspection type in descending order.

-- Pattern:
-- Aggregation + Pivot using conditional aggregation (CASE WHEN)

-- Technique:
-- Use SUM(CASE WHEN ...) to count occurrences of each risk category and group by inspection_type.
-- Then compute total inspections by summing all category counts.

-- Time complexity idea:
-- O(N), where N is the number of rows in the table.
-- Single pass aggregation with GROUP BY.

-- Solution:
SELECT 
    inspection_type,
    no_risk_results,
    low_risk_results,
    medium_risk_results,
    high_risk_results,
    (no_risk_results + low_risk_results + medium_risk_results + high_risk_results) AS total_inspections
FROM (
    SELECT 
        inspection_type,
        SUM(CASE WHEN risk_category IS NULL THEN 1 ELSE 0 END) AS no_risk_results,
        SUM(CASE WHEN risk_category = 'Low Risk' THEN 1 ELSE 0 END) AS low_risk_results,
        SUM(CASE WHEN risk_category = 'Moderate Risk' THEN 1 ELSE 0 END) AS medium_risk_results,
        SUM(CASE WHEN risk_category = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_results
    FROM sf_restaurant_health_violations
    GROUP BY inspection_type
) t
ORDER BY total_inspections DESC;
