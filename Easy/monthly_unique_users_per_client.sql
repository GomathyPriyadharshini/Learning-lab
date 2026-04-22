/*
Problem:
Return the number of unique users per client for each month.
Assume all events occur within the same year.
Output month as a number (1–12).

Pattern:
Grouping + Distinct Counting

Technique:
- Extract month using MONTH()
- COUNT DISTINCT user_id
- Group by client_id and month

Time Complexity Idea:
- O(n) scan
- DISTINCT adds extra cost
*/

SELECT 
    client_id,
    MONTH(time_id) AS month,
    COUNT(DISTINCT user_id) AS users_num
FROM fact_events
GROUP BY client_id, MONTH(time_id)
ORDER BY client_id, month;
