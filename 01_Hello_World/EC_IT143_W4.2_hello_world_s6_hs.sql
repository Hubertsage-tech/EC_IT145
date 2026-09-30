-- EC_IT143_W4.2_hello_world_s6_hs.sql
-- Step 6: Load the table from the view using an ad hoc SQL script
USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.HelloWorld;
GO

INSERT INTO dbo.HelloWorld (Message)
SELECT Message
FROM dbo.v_HelloWorld;
GO

SELECT *
FROM dbo.HelloWorld;
GO
