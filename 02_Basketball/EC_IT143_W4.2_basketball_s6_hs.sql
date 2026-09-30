-- EC_IT143_W4.2_basketball_s6_hs.sql
-- Step 6: Load the table from the view using an ad hoc SQL script
USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.BasketballPlayerCount;
GO

INSERT INTO dbo.BasketballPlayerCount
(
    TeamID,
    TeamName,
    PlayerCount
)
SELECT
    TeamID,
    TeamName,
    PlayerCount
FROM dbo.v_BasketballPlayerCount;
GO

SELECT *
FROM dbo.BasketballPlayerCount
ORDER BY TeamName;
GO
