/*
    Assignment: EC_IT143 6.3 - Fun with Functions
    Topic: Extract the last name
    Step: 3
    Student initials: KHS
    Purpose: Follow the step-by-step T-SQL problem-solving process.
*/


USE EC_IT143_DA;
GO

-- Ad hoc query: extract the final word as the last name.
-- This simple approach assumes the last name is the final word.
SELECT
    ContactName,
    CASE
        WHEN ContactName IS NULL THEN NULL
        WHEN CHARINDEX(' ', LTRIM(RTRIM(ContactName))) = 0
            THEN LTRIM(RTRIM(ContactName))
        ELSE RIGHT(
            LTRIM(RTRIM(ContactName)),
            CHARINDEX(' ', REVERSE(LTRIM(RTRIM(ContactName))) + ' ') - 1
        )
    END AS LastName
FROM dbo.t_w3_schools_customers;
GO
