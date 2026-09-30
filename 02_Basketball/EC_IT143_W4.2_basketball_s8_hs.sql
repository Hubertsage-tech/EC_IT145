-- EC_IT143_W4.2_basketball_s8_hs.sql
-- Step 8: Call the stored procedure
USE EC_IT143_DA;
GO

EXEC dbo.usp_LoadBasketballPlayerCount;
GO

SELECT *
FROM dbo.BasketballPlayerCount
ORDER BY TeamName;
GO
