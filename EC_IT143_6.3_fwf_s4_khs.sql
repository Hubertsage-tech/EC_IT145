/*
    Assignment: EC_IT143 6.3 - Fun with Functions
    Topic: Extract the last name
    Step: 4
    Student initials: KHS
    Purpose: Follow the step-by-step T-SQL problem-solving process.
*/


-- Research note:
-- REVERSE() reverses the characters in a string, so CHARINDEX() can find
-- the final space in the original string.
-- RIGHT() returns the characters to the right of that final space.
-- This simple solution treats the final word as the last name; names with
-- multiple-word family names may need a different rule.
-- Reference: https://learn.microsoft.com/en-us/sql/t-sql/functions/reverse-transact-sql
-- Reference: https://learn.microsoft.com/en-us/sql/t-sql/functions/right-transact-sql
-- Test the ad hoc query from Step 3 before creating the function.
