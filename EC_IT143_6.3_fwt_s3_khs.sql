/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified date
    Step: 3
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


USE EC_IT143_DA;
GO

-- Inspect the table columns before adding an audit column.
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 't_w3_schools_customers'
ORDER BY ORDINAL_POSITION;
GO

-- The standard W3Schools Customers table uses CustomerID as its key.
-- Confirm that your materialized table has CustomerID before running Step 4.
