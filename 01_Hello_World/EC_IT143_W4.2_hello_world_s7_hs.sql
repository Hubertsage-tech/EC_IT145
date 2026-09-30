-- EC_IT143_W4.2_hello_world_s7_hs.sql
-- Step 7: Turn the ad hoc SQL script into a stored procedure
USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_LoadHelloWorld;
GO

CREATE PROCEDURE dbo.usp_LoadHelloWorld
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.HelloWorld;

    INSERT INTO dbo.HelloWorld (Message)
    SELECT Message
    FROM dbo.v_HelloWorld;
END;
GO
