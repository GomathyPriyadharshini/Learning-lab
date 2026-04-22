/*
Problem:
Find all employees who earn more than $80,000 and work in either 
the HR or Admin department. Return first name, last name, department, and salary.

Pattern:
Filtering with Multiple Conditions

Technique:
- Use WHERE clause
- Filter using IN for multiple departments
- Apply numeric condition on salary

Time Complexity Idea:
- O(n) full table scan
- Can be optimized with indexes on (department, salary)
*/

SELECT 
    first_name,
    last_name,
    department,
    salary
FROM techcorp_workforce
WHERE department IN ('HR', 'Admin')
  AND salary > 80000;
