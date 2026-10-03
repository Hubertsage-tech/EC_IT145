USE MyCommunities;
GO

/*
    EC IT 143 - Week 5.2
    My Communities Analysis
    Community: Soccer
    Student: Kwizera Hubert Sage
*/

------------------------------------------------------------
-- QUESTION 1
-- Author: Kwizera Hubert Sage
--
-- Which soccer players have scored the most goals?
------------------------------------------------------------

SELECT
    PlayerName,
    Position,
    Goals,
    Assists
FROM SoccerPlayers
ORDER BY
    Goals DESC;


------------------------------------------------------------
-- QUESTION 2
-- Author: Other Student
--
-- Which soccer players have the most assists?
------------------------------------------------------------

SELECT
    PlayerName,
    Position,
    Goals,
    Assists
FROM SoccerPlayers
ORDER BY
    Assists DESC;


------------------------------------------------------------
-- QUESTION 3
-- Author: Kwizera Hubert Sage
--
-- What is the average number of goals scored by players
-- in each position?
------------------------------------------------------------

SELECT
    Position,
    AVG(CAST(Goals AS decimal(10,2))) AS AverageGoals
FROM SoccerPlayers
GROUP BY
    Position
ORDER BY
    AverageGoals DESC;


------------------------------------------------------------
-- QUESTION 4
-- Author: Kwizera Hubert Sage
--
-- How many soccer players are on each team and what are
-- the total goals and assists for each team?
------------------------------------------------------------

SELECT
    TeamID,
    COUNT(PlayerID) AS NumberOfPlayers,
    SUM(Goals) AS TotalGoals,
    SUM(Assists) AS TotalAssists
FROM SoccerPlayers
GROUP BY
    TeamID
ORDER BY
    TotalGoals DESC;
