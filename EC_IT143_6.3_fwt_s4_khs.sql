/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified user
    Step: 4
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


USE EC_IT143_DA;
GO

-- Add the audit column only if it does not already exist.
IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedBy') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD LastModifiedBy NVARCHAR(128) NULL;
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_Customers_LastModifiedBy
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Avoid responding to an audit-column update made by either trigger.
    IF UPDATE(LastModifiedDate) OR UPDATE(LastModifiedBy)
        RETURN;

    UPDATE c
    SET LastModifiedBy = SUSER_SNAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;
END;
GO
