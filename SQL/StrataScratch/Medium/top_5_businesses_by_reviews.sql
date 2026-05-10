-- Problem:
-- Find the top 5 businesses with most reviews.
-- Each row contains a unique business_id and total review count per business.
-- Output business name and total number of reviews.
-- Order results by total reviews in descending order.
-- If there are ties, use ranking where same review counts share same rank
-- and subsequent ranks are skipped (dense tie-aware ranking not required; standard ranking needed).

-- Pattern:
-- Window function (RANK) for ranking + filtering top N

-- Technique:
-- Use RANK() OVER (ORDER BY review_count DESC) to handle ties correctly.
-- Filter rows where rank <= 5.

-- Time complexity idea:
-- O(N log N) due to sorting for window function.

-- Solution:
SELECT 
    business_name,
    review_count
FROM (
    SELECT 
        business_name,
        review_count,
        RANK() OVER (ORDER BY review_count DESC) AS rnk
    FROM yelp_business
) t
WHERE rnk <= 5
ORDER BY review_count DESC;
