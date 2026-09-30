-- EC_IT143_W4.2_soccer_s7_hs.sql
-- Step 7: Turn the ad hoc SQL script into a stored procedure
USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_LoadSoccerPlayerCount;
GO

CREATE PROCEDURE dbo.usp_LoadSoccerPlayerCount
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.SoccerPlayerCount;

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
END;
GO
