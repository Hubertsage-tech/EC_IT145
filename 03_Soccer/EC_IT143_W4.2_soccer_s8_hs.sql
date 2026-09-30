-- EC_IT143_W4.2_soccer_s8_hs.sql
-- Step 8: Call the stored procedure
USE EC_IT143_DA;
GO

EXEC dbo.usp_LoadSoccerPlayerCount;
GO

SELECT *
FROM dbo.SoccerPlayerCount
ORDER BY TeamName;
GO
