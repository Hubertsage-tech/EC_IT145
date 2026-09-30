-- EC_IT143_W4.2_basketball_s3_hs.sql
-- Step 3: Create an ad hoc SQL query
USE EC_IT143_DA;
GO

SELECT
    t.TeamID,
    t.TeamName,
    COUNT(p.PlayerID) AS PlayerCount
FROM dbo.BasketballTeams AS t
LEFT JOIN dbo.BasketballPlayers AS p
    ON t.TeamID = p.TeamID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    t.TeamName;
GO
