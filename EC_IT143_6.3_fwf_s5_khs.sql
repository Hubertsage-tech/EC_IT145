/*
    Assignment: EC_IT143 6.3 - Fun with Functions
    Topic: Extract the last name
    Step: 5
    Student initials: KHS
    Purpose: Follow the step-by-step T-SQL problem-solving process.
*/


USE EC_IT143_DA;
GO

CREATE OR ALTER FUNCTION dbo.ufn_LastNameFromContact
(
    @ContactName NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    -- Return the final word as the last name.
    -- Return NULL when the input is NULL.
    DECLARE @CleanName NVARCHAR(100);
    DECLARE @LastName NVARCHAR(100);

    IF @ContactName IS NULL
        RETURN NULL;

    SET @CleanName = LTRIM(RTRIM(@ContactName));

    IF @CleanName = N''
        RETURN N'';

    SET @LastName =
        CASE
            WHEN CHARINDEX(' ', @CleanName) = 0 THEN @CleanName
            ELSE RIGHT(
                @CleanName,
                CHARINDEX(' ', REVERSE(@CleanName) + ' ') - 1
            )
        END;

    RETURN @LastName;
END;
GO

-- Quick function check:
SELECT dbo.ufn_LastNameFromContact(N'Maria Anders') AS LastName;
GO
