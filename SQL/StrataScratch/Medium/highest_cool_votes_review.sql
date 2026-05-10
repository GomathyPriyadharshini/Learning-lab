-- Problem:
-- Find the review_text that received the highest number of cool votes.
-- Output the business name along with the review text.

-- Pattern:
-- Window function with ranking

-- Technique:
-- Use DENSE_RANK() to rank reviews based on cool votes in descending order.
-- Filter for rank = 1 to get the highest voted review(s).

-- Time complexity idea:
-- O(N log N) due to sorting for window function.

-- Solution:
SELECT 
    business_name,
    review_text
FROM (
    SELECT 
        business_name,
        review_text,
        DENSE_RANK() OVER (ORDER BY cool DESC) AS rank_num
    FROM yelp_reviews
) t
WHERE rank_num = 1;
