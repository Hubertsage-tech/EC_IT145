-- EC_IT143_W4.2_basketball_s5.1_hs.sql
-- Step 5.1: Turn the view into a table
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.BasketballPlayerCount;
GO

SELECT *
INTO dbo.BasketballPlayerCount
FROM dbo.v_BasketballPlayerCount;
GO

SELECT *
FROM dbo.BasketballPlayerCount
ORDER BY TeamName;
GO
