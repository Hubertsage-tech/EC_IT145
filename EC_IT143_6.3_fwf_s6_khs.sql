/*
    Assignment: EC_IT143 6.3 - Fun with Functions
    Topic: Extract the last name
    Step: 6
    Student initials: KHS
    Purpose: Follow the step-by-step T-SQL problem-solving process.
*/


USE EC_IT143_DA;
GO

-- Compare the ad hoc expression and the scalar function side by side.
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
    END AS AdHocLastName,
    dbo.ufn_LastNameFromContact(ContactName) AS FunctionLastName
FROM dbo.t_w3_schools_customers;
GO
