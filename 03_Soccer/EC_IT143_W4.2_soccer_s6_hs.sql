-- EC_IT143_W4.2_soccer_s6_hs.sql
-- Step 6: Load the table from the view using an ad hoc SQL script
USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.SoccerPlayerCount;
GO

INSERT INTO dbo.SoccerPlayerCount
(
    TeamID,
    TeamName,
    PlayerCount
)
SELECT
    TeamID,
    TeamName,
    PlayerCount
FROM dbo.v_SoccerPlayerCount;
GO

SELECT *
FROM dbo.SoccerPlayerCount
ORDER BY TeamName;
GO
