USE MyCommunities;
GO

/*
    EC IT 143 - Week 5.2
    My Communities Analysis
    Community: Basketball
    Student: Kwizera Hubert Sage
*/

------------------------------------------------------------
-- QUESTION 1
-- Author: Kwizera Hubert Sage
--
-- Which basketball players have more than 10 points
-- per game?
------------------------------------------------------------

SELECT
    PlayerName,
    Position,
    PointsPerGame,
    AssistsPerGame
FROM BasketballPlayers
WHERE PointsPerGame > 10
ORDER BY PointsPerGame DESC;


------------------------------------------------------------
-- QUESTION 2
-- Author: Other Student
--
-- Which basketball team has the highest average
-- points per game among its players?
------------------------------------------------------------

SELECT
    bt.TeamName,
    AVG(bp.PointsPerGame) AS AveragePointsPerGame
FROM BasketballPlayers AS bp
INNER JOIN BasketballTeams AS bt
    ON bp.TeamID = bt.TeamID
GROUP BY
    bt.TeamName
ORDER BY
    AveragePointsPerGame DESC;


------------------------------------------------------------
-- QUESTION 3
-- Author: Kwizera Hubert Sage
--
-- Which basketball position has the highest average
-- assists per game?
------------------------------------------------------------

SELECT
    Position,
    AVG(AssistsPerGame) AS AverageAssistsPerGame
FROM BasketballPlayers
GROUP BY
    Position
ORDER BY
    AverageAssistsPerGame DESC;


------------------------------------------------------------
-- QUESTION 4
-- Author: Kwizera Hubert Sage
--
-- How many players are on each basketball team and
-- what is their average points per game?
------------------------------------------------------------

SELECT
    bt.TeamName,
    COUNT(bp.PlayerID) AS NumberOfPlayers,
    AVG(bp.PointsPerGame) AS AveragePointsPerGame
FROM BasketballTeams AS bt
INNER JOIN BasketballPlayers AS bp
    ON bt.TeamID = bp.TeamID
GROUP BY
    bt.TeamName
ORDER BY
    AveragePointsPerGame DESC;
