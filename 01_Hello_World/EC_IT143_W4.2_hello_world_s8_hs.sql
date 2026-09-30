-- EC_IT143_W4.2_hello_world_s8_hs.sql
-- Step 8: Call the stored procedure
USE EC_IT143_DA;
GO

EXEC dbo.usp_LoadHelloWorld;
GO

SELECT *
FROM dbo.HelloWorld;
GO
