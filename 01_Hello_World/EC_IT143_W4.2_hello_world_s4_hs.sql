-- EC_IT143_W4.2_hello_world_s4_hs.sql
-- Step 4: Turn the ad hoc SQL query into a view
USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_HelloWorld;
GO

CREATE VIEW dbo.v_HelloWorld
AS
    SELECT 'Hello World' AS Message;
GO

SELECT *
FROM dbo.v_HelloWorld;
GO
