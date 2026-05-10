/*
Problem:
Calculate the ratio of employees who have a NULL phone number.

Pattern:
Aggregation + Conditional Counting

Technique:
- Use COUNT with CASE WHEN for conditional counting
- Divide by total count
- Ensure decimal division using 1.0 multiplier

Time Complexity Idea:
- O(n) full table scan
*/

SELECT 
    ROUND(
        COUNT(CASE WHEN phone_number IS NULL THEN 1 END) * 1.0 
        / COUNT(*),
    2) AS null_phone_ratio
FROM techcorp_workforce;
