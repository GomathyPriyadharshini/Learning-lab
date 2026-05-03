-- Problem:
-- Find matching hosts and guests pairs such that they are both of the same gender and nationality.
-- Output the host id and the guest id of matched pair.

-- Pattern:
-- Join between two tables based on matching attributes

-- Technique:
-- Perform an inner join between hosts and guests using gender and nationality as join conditions.
-- Each matching combination forms a valid host-guest pair.

-- Time complexity idea:
-- O(N * M), where N = number of hosts and M = number of guests.
-- Join performance depends on indexing on gender and nationality.

-- Solution:
SELECT DISTINCT
    t1.host_id,
    t2.guest_id
FROM airbnb_hosts t1
JOIN airbnb_guests t2
    ON t1.gender = t2.gender
   AND t1.nationality = t2.nationality;
