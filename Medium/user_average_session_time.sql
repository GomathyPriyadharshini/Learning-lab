/*
Problem:
Calculate each user's average session time, where a session is defined as the time difference 
between a page_load and a page_exit.

Assumptions:
- Each user has only one session per day
- If multiple page_load/page_exit events exist in a day:
  → use latest page_load
  → use earliest page_exit
- Only consider valid sessions where page_load < page_exit

Pattern:
Grouping + Aggregation + Join

Technique:
- Aggregate page_load per user per day using MAX(timestamp)
- Aggregate page_exit per user per day using MIN(timestamp)
- Join on user_id and date
- Compute session duration using TIMESTAMPDIFF
- Average per user

Time Complexity Idea:
- O(n) scan
- Grouping + join overhead
*/

SELECT 
    user_id,
    AVG(avg_session_duration) AS avg_session_duration
FROM (
    SELECT 
        tb1.user_id,
        TIMESTAMPDIFF(SECOND, pl_timestamp, pe_timestamp) AS avg_session_duration 
    FROM (
        SELECT 
            user_id,
            DATE(timestamp) AS dt,
            MAX(timestamp) AS pl_timestamp 
        FROM facebook_web_log 
        WHERE action = 'page_load' 
        GROUP BY user_id, DATE(timestamp)
    ) tb1 
    INNER JOIN (
        SELECT 
            user_id,
            DATE(timestamp) AS dt,
            MIN(timestamp) AS pe_timestamp 
        FROM facebook_web_log 
        WHERE action = 'page_exit' 
        GROUP BY user_id, DATE(timestamp)
    ) tb2 
        ON tb1.user_id = tb2.user_id 
       AND tb1.dt = tb2.dt 
       AND tb1.pl_timestamp < tb2.pe_timestamp
) tb3
GROUP BY user_id;
