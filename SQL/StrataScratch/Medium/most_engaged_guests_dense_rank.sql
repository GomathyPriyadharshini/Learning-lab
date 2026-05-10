-- Problem:
-- Identify the most engaged guests by ranking them based on total messages exchanged.
-- Guests with the same number of messages should share the same rank.
-- Ranking should not skip numbers (use dense ranking).
-- Output: rank, guest_id, total messages ordered from highest to lowest activity.

-- Pattern:
-- Aggregation + window function ranking

-- Technique:
-- First aggregate total messages per guest,
-- then apply DENSE_RANK() to rank them without gaps.

-- Time complexity idea:
-- O(n log n) due to grouping and sorting for window function

-- Solution:

SELECT 
    DENSE_RANK() OVER (ORDER BY sum_n_messages DESC) AS ranking,
    id_guest,
    sum_n_messages
FROM (
    SELECT 
        id_guest,
        SUM(n_messages) AS sum_n_messages
    FROM airbnb_contacts
    GROUP BY id_guest
) a
ORDER BY ranking, id_guest;
