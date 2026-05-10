-- Problem:
-- Calculate the friend acceptance rate for each date when friend requests were sent.
-- A request is sent if action = 'sent' and accepted if action = 'accepted'.
-- If a request is not accepted, there is no record of it being accepted.
-- Only include dates where at least one request was accepted.

-- Pattern:
-- Self join / same table join (sent vs accepted)

-- Technique:
-- LEFT JOIN + COUNT(non-null) vs COUNT(*) to compute ratio

-- Time complexity idea:
-- O(n log n) or O(n) depending on indexing (join on sender + receiver)

-- Solution:

WITH acc AS (
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'accepted'
),
sen AS (
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'sent'
)

SELECT 
    sen.date,
    COUNT(acc.user_id_receiver) / COUNT(sen.user_id_sender) AS acceptance_rate
FROM sen
LEFT JOIN acc
    ON acc.user_id_sender = sen.user_id_sender
   AND acc.user_id_receiver = sen.user_id_receiver
GROUP BY sen.date
HAVING COUNT(acc.user_id_receiver) > 0
ORDER BY sen.date;
