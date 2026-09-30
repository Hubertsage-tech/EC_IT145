-- EC_IT143_W4.2_basketball_s5.2_hs.sql
-- Step 5.2: Refine the table architecture
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.BasketballPlayerCount;
GO

CREATE TABLE dbo.BasketballPlayerCount
(
    TeamID INT NOT NULL,
    TeamName NVARCHAR(100) NOT NULL,
    PlayerCount INT NOT NULL,
    CONSTRAINT PK_BasketballPlayerCount PRIMARY KEY (TeamID)
);
GO

SELECT *
FROM dbo.BasketballPlayerCount;
GO
