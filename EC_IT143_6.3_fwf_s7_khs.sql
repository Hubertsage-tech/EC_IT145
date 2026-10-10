/*
    Assignment: EC_IT143 6.3 - Fun with Functions
    Topic: Extract the last name
    Step: 7
    Student initials: KHS
    Purpose: Follow the step-by-step T-SQL problem-solving process.
*/


USE EC_IT143_DA;
GO

-- Expected result: zero rows if the function matches the ad hoc expression.
WITH LastNameCheck AS
(
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
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM LastNameCheck
WHERE ISNULL(AdHocLastName, N'<NULL>') <> ISNULL(FunctionLastName, N'<NULL>');
GO
