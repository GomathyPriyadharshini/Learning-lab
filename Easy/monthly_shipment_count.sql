/*
Problem:
Calculate the number of shipments per month.
Return year_month in format YYYY-MM and shipment count.

Pattern:
Grouping + Aggregation

Technique:
- Use SUBSTRING to extract YYYY-MM
- COUNT shipment_id
- Group by extracted year_month

Time Complexity Idea:
- O(n) full table scan
*/

SELECT 
    COUNT(shipment_id) AS shipment_count,
    SUBSTRING(shipment_date, 1, 7) AS date_ym
FROM amazon_shipment
GROUP BY SUBSTRING(shipment_date, 1, 7)
ORDER BY date_ym;
