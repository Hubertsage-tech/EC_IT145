-- EC_IT143_W4.2_soccer_s5.2_hs.sql
-- Step 5.2: Refine the table architecture
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.SoccerPlayerCount;
GO

CREATE TABLE dbo.SoccerPlayerCount
(
    TeamID INT NOT NULL,
    TeamName NVARCHAR(100) NOT NULL,
    PlayerCount INT NOT NULL,
    CONSTRAINT PK_SoccerPlayerCount PRIMARY KEY (TeamID)
);
GO

SELECT *
FROM dbo.SoccerPlayerCount;
GO
