-- Problem:
-- Find the average total compensation based on employee titles and gender.
-- Total compensation = salary + bonus.
-- Ignore employees without bonuses.
-- Employees may have multiple bonuses.
-- Output employee_title, sex, and average total compensation.

-- Pattern:
-- Aggregation with join + group by

-- Technique:
-- First aggregate bonuses per employee.
-- Join with employee table to get salary.
-- Compute total compensation per employee.
-- Then take average grouped by employee_title and sex.

-- Time complexity idea:
-- O(N + M), where N = employees, M = bonus records.

-- Solution:
WITH cte AS (
    SELECT 
        worker_ref_id,
        SUM(bonus) AS total_bonus
    FROM sf_bonus
    GROUP BY worker_ref_id
)
SELECT 
    t1.employee_title,
    t1.sex,
    AVG(t1.salary + t2.total_bonus) AS avg_total_compensation
FROM sf_employee t1
JOIN cte t2
    ON t1.id = t2.worker_ref_id
GROUP BY 
    t1.employee_title,
    t1.sex;
