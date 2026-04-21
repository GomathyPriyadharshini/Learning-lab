/*
Problem:
Find all inspection details made for facilities owned by 'GLASSELL COFFEE SHOP LLC'.

Pattern:
Basic Filtering

Technique:
- Use WHERE clause
- Exact string match on owner_name

Time Complexity Idea:
- O(n) full table scan
- Can be optimized with index on owner_name
*/

SELECT *
FROM los_angeles_restaurant_health_inspections
WHERE owner_name = 'GLASSELL COFFEE SHOP LLC';
