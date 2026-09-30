-- EC_IT143_W4.2_hello_world_s5.1_hs.sql
-- Step 5.1: Turn the view into a table
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.HelloWorld;
GO

SELECT *
INTO dbo.HelloWorld
FROM dbo.v_HelloWorld;
GO

SELECT *
FROM dbo.HelloWorld;
GO
