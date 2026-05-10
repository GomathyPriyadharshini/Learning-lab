/*
Problem:
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in descending order.

Pattern:
Grouping and Aggregation

Technique:
- WHERE filter on device
- GROUP BY event_name
- COUNT(*) for aggregation
- ORDER BY descending

Time Complexity Idea:
- O(n) scan
- Grouping depends on number of distinct event names
*/

SELECT 
    event_name,
    COUNT(*) AS event_count
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY event_count DESC;
