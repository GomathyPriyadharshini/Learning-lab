-- Problem Statement:
-- Find the top 10 ranked songs in 2010.
-- Output:
-- - rank
-- - group name
-- - song name
-- Do not show the same song twice.
-- Sort results by rank in ascending order.

-- Pattern:
-- Filtering + Deduplication + Ordering

-- Technique:
-- Filter by year and rank,
-- group by song to remove duplicates,
-- then order by rank.

-- Time complexity idea:
-- O(N)
-- where N is number of records in billboard_top_100_year_end

-- Solution:

SELECT
    year_rank AS rank,
    group_name,
    song_name
FROM billboard_top_100_year_end
WHERE year = 2010
  AND year_rank <= 10
GROUP BY year_rank, group_name, song_name
ORDER BY year_rank ASC;
