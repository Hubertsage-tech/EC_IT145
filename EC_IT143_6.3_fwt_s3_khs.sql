/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified user
    Step: 3
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


USE EC_IT143_DA;
GO

-- Research reference for the SQL Server login name function:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/suser-sname-transact-sql
SELECT SUSER_SNAME() AS CurrentServerLogin;
GO

-- Confirm the table has CustomerID and review existing audit columns.
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 't_w3_schools_customers'
ORDER BY ORDINAL_POSITION;
GO
