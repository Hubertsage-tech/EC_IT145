-- EC_IT143_W4.2_basketball_s7_hs.sql
-- Step 7: Turn the ad hoc SQL script into a stored procedure
USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_LoadBasketballPlayerCount;
GO

CREATE PROCEDURE dbo.usp_LoadBasketballPlayerCount
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.BasketballPlayerCount;

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
END;
GO
