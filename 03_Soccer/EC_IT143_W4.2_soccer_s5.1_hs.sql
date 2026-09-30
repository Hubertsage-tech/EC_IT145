-- EC_IT143_W4.2_soccer_s5.1_hs.sql
-- Step 5.1: Turn the view into a table
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.SoccerPlayerCount;
GO

SELECT *
INTO dbo.SoccerPlayerCount
FROM dbo.v_SoccerPlayerCount;
GO

SELECT *
FROM dbo.SoccerPlayerCount
ORDER BY TeamName;
GO
