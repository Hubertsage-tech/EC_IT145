-- EC_IT143_W4.2_soccer_s3_hs.sql
-- Step 3: Create an ad hoc SQL query
USE EC_IT143_DA;
GO

SELECT
    t.TeamID,
    t.TeamName,
    COUNT(p.PlayerID) AS PlayerCount
FROM dbo.SoccerTeams AS t
LEFT JOIN dbo.SoccerPlayers AS p
    ON t.TeamID = p.TeamID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    t.TeamName;
GO
