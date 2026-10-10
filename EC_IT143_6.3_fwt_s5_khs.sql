/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified user
    Step: 5
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


USE EC_IT143_DA;
GO

-- Update a row and verify that LastModifiedBy is populated.
SELECT TOP (5) CustomerID, ContactName, LastModifiedBy
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;
GO

DECLARE @CustomerID INT;

SELECT TOP (1) @CustomerID = CustomerID
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;

IF @CustomerID IS NOT NULL
BEGIN
    UPDATE dbo.t_w3_schools_customers
    SET City = City
    WHERE CustomerID = @CustomerID;
END;
GO

SELECT TOP (5) CustomerID, ContactName, LastModifiedBy
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;
GO
