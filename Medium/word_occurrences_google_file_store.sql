--Problem Statement:
--Find the number of times each word appears in the contents column across all rows in the google_file_store dataset.
--Output two columns:
-- word
-- occurrences

-- Pattern:
-- Recursive CTE + String Splitting

-- Technique:
-- Normalize text by converting to lowercase and removing punctuation,
-- then recursively split words using SUBSTRING_INDEX and aggregate counts.

-- Time complexity idea:
-- O(N * W)
-- where N is the number of rows and W is the average number of words per row.

--Solution:

WITH RECURSIVE cte AS (
    SELECT
        1 AS n,
        REPLACE(REPLACE(LOWER(contents), '.', ''), ',', '') AS txt,
        SUBSTRING_INDEX(
            REPLACE(REPLACE(LOWER(contents), '.', ''), ',', ''),
            ' ',
            1
        ) AS converted_txt
    FROM google_file_store

    UNION ALL

    SELECT
        n + 1,
        txt,
        SUBSTRING_INDEX(
            SUBSTRING_INDEX(txt, ' ', n + 1),
            ' ',
            -1
        ) AS converted_txt
    FROM cte
    WHERE n < LENGTH(txt) - LENGTH(REPLACE(txt, ' ', '')) + 1
)

SELECT
    converted_txt AS word,
    COUNT(*) AS occurrences
FROM cte
GROUP BY word
ORDER BY occurrences DESC;
