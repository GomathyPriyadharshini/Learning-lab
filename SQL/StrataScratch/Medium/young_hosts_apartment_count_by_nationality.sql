-- Problem:
-- Write a query that returns how many different apartment-type units 
-- (counted by distinct unit_id) are owned by people under 30, 
-- grouped by their nationality. Sort the results by the number 
-- of apartments in descending order.

-- Pattern:
-- Filtering + Aggregation with JOIN

-- Technique:
-- 1. Filter hosts under 30 using a CTE
-- 2. Join with units on host_id
-- 3. Filter for 'Apartment' unit_type
-- 4. Count distinct unit_id
-- 5. Group by nationality and sort descending

-- Time complexity idea:
-- O(H + U log U)
-- H = number of hosts (filtering)
-- U = number of units (join + aggregation + sort)

-- Solution:
WITH hosts AS (
    SELECT DISTINCT host_id, nationality
    FROM airbnb_hosts
    WHERE age < 30
)

SELECT 
    h.nationality,
    COUNT(DISTINCT u.unit_id) AS apartment_count
FROM airbnb_units u
JOIN hosts h 
    ON u.host_id = h.host_id
WHERE u.unit_type = 'Apartment'
GROUP BY h.nationality
ORDER BY apartment_count DESC;
