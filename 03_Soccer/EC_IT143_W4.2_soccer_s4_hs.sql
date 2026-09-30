-- EC_IT143_W4.2_soccer_s4_hs.sql
-- Step 4: Turn the ad hoc SQL query into a view
USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_SoccerPlayerCount;
GO

CREATE VIEW dbo.v_SoccerPlayerCount
AS
    SELECT
        t.TeamID,
        t.TeamName,
        COUNT(p.PlayerID) AS PlayerCount
    FROM dbo.SoccerTeams AS t
    LEFT JOIN dbo.SoccerPlayers AS p
        ON t.TeamID = p.TeamID
    GROUP BY
        t.TeamID,
        t.TeamName;
GO

SELECT *
FROM dbo.v_SoccerPlayerCount
ORDER BY TeamName;
GO
