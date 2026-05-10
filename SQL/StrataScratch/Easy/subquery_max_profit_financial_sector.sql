/*
Problem:
Find the most profitable company from the financial sector. 
Output the result along with the continent.

Pattern:
Subquery (Max Value Filtering)

Technique:
- Filter by sector
- Use subquery to find MAX(profits) within that sector

Time Complexity Idea:
- O(n) scan
- Subquery also O(n)
*/

SELECT 
    company,
    continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
  AND profits = (
      SELECT MAX(profits)
      FROM forbes_global_2010_2014
      WHERE sector = 'Financials'
  );
