/*
Problem:
Users Missing Phone Numbers

The product team is launching a new WhatsApp notification feature and needs to identify 
users who haven't provided their phone numbers yet.

Find all users who have not provided a phone number. 
Return the user ID and name.

Pattern:
Basic Filtering

Technique:
- Use WHERE clause with IS NULL condition
- Select only required columns

Time Complexity Idea:
- O(n) full table scan
- Can be optimized with index on phone_number
*/

SELECT 
    user_id,
    user_name
FROM fintech_app_users
WHERE phone_number IS NULL;
