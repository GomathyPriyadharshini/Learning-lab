-- Problem:
-- Identify projects that are overbudget by comparing project budget
-- with total prorated employee cost based on actual working duration.
-- Each employee salary is prorated daily (annual salary / 365).
-- Project cost = sum of prorated salaries for all assigned employees.
-- Round up final cost and compare with budget.

-- Pattern:
-- Join multiple tables + time-based cost allocation + aggregation

-- Technique:
-- Prorated calculation using (salary / 365) * days worked,
-- aggregate per project, then filter using HAVING/WHERE.

-- Time complexity idea:
-- O(n) for joins + grouping (depends on indexing of project_id and emp_id)

-- Solution:

SELECT 
    title,
    budget,
    CEIL(total_cost) AS prorated_employee_expense
FROM (
    SELECT 
        proj.title,
        proj.budget,
        SUM(
            (emp.salary / 365) * 
            (DATEDIFF(emp_proj.end_date, emp_proj.start_date) + 1)
        ) AS total_cost
    FROM linkedin_projects proj
    INNER JOIN linkedin_emp_projects emp_proj
        ON proj.id = emp_proj.project_id
    INNER JOIN linkedin_employees emp
        ON emp_proj.emp_id = emp.id
    GROUP BY proj.title, proj.budget
) t
WHERE budget < CEIL(total_cost)
ORDER BY title;
