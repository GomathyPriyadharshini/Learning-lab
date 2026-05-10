-- Problem:
-- Find drafts which contain the word 'optimism'.

-- Pattern: Filtering (LIKE conditions)
-- Technique: String matching with LIKE
-- Time complexity idea: O(n)

SELECT *
FROM google_file_store
WHERE contents LIKE '%optimism%'
  AND filename LIKE 'draft%';
