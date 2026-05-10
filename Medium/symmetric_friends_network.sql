-- Problem Statement:
-- Make the friends network symmetric.
-- For example, if 0 and 1 are friends,
-- the output should contain both 0->1 and 1->0.

-- Pattern:
-- UNION for bidirectional relationship generation

-- Technique:
-- Select original friendship pairs and union them
-- with reversed pairs to ensure symmetry.

-- Time complexity idea:
-- O(N)
-- where N is the number of rows in google_friends_network.

-- Solution:

SELECT
    user_id,
    friend_id
FROM google_friends_network

UNION

SELECT
    friend_id,
    user_id
FROM google_friends_network;
