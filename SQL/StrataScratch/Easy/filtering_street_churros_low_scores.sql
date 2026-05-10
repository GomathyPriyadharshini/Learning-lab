/*
Problem:
Find the inspection date and risk category (pe_description) of facilities 
named 'STREET CHURROS' that received a score below 95.

Pattern:
Basic Filtering

Technique:
- Use WHERE clause with multiple conditions
- String filter on facility_name
- Numeric filter using score < 95

Time Complexity Idea:
- O(n) full table scan
- Can be optimized with indexes on (facility_name, score)
*/

SELECT 
    activity_date,
    pe_description
FROM los_angeles_restaurant_health_inspections
WHERE facility_name = 'STREET CHURROS'
  AND score < 95;
