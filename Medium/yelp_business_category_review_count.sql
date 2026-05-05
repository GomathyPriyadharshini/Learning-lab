-- Problem:
-- Calculate number of reviews for every business category.
-- Output category with total review_count.
-- Order by total reviews in descending order.

-- Pattern:
-- Recursive CTE for splitting delimited strings + aggregation

-- Technique:
-- Use recursive CTE to split semicolon-separated categories into rows.
-- Then aggregate review_count per category.

-- Time complexity idea:
-- O(N * K), where N = number of rows and K = average number of categories per row.

WITH RECURSIVE cte AS (
    -- Anchor step
    SELECT 
        1 AS n,
        review_count,
        categories AS full_categories,
        SUBSTRING_INDEX(categories, ';', 1) AS category,
        (LENGTH(categories) - LENGTH(REPLACE(categories, ';', '')) + 1) AS max_parts
    FROM yelp_business

    UNION ALL

    -- Recursive step
    SELECT 
        n + 1,
        review_count,
        full_categories,
        SUBSTRING_INDEX(
            SUBSTRING_INDEX(full_categories, ';', n + 1),
            ';',
            -1
        ) AS category,
        max_parts
    FROM cte
    WHERE n < max_parts
)

SELECT 
    category,
    SUM(review_count) AS review_cnt
FROM cte
GROUP BY category
ORDER BY review_cnt DESC;
