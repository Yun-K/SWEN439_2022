-- 1.The police department wants to know which robbers are most active,but were never penalised.
-- Construct a view that contains the Nicknames of all robbers who participated in more robberies than the average, but spent no time in prison. The answer should be sorted in decreasing order of the individual total “earnings” of the robbers.
DROP VIEW RobbersAboveAvgNotInPrison;
DROP VIEW averageRobberies;
DROP VIEW RobberiesPerRobber;
CREATE VIEW RobberiesPerRobber AS(
    SELECT RobberId,
        COUNT(RobberId) AS robberyTimes
    FROM Accomplices a
    GROUP BY robberid
    ORDER BY Robberid
);
CREATE VIEW averageRobberies AS(
    SELECT SUM(perRobberView.robberyTimes) AS TotalRobberies,
        COUNT(robber.*) AS TotalRobbers,
        (
            SUM(perRobberView.robberyTimes) / COUNT(robber.*)
        ) AS AVGRobberies
    FROM Robbers robber
        NATURAL JOIN RobberiesPerRobber perRobberView
);
CREATE VIEW RobbersAboveAvgNotInPrison AS(
    SELECT RobberID,
        NickName,
        robberyTimes,
        NoYears,
        avg.AVGRobberies
    FROM Robbers
        NATURAL JOIN RobberiesPerRobber,
        averageRobberies avg
    WHERE robberyTimes > AVGRobberies
        AND NoYears = 0
);
SELECT r.RobberId,
    r.NickName,
    SUM(a.Share) AS TotalEarning
FROM RobbersAboveAvgNotInPrison r
    NATURAL JOIN Accomplices a
GROUP BY r.RobberId,
    r.Nickname
ORDER BY TotalEarning DESC;
-- 
-- 
-- 
SELECT RobberId,
    NickName,
    SUM(a.Share) AS TotalEarning
FROM (
        SELECT RobberId,
            COUNT(RobberId) AS robberyTimes
        FROM Accomplices a
        GROUP BY robberid
        ORDER BY Robberid
    ) SB
    NATURAL JOIN (
        SELECT (
                SUM(SB.robberyTimes) / COUNT(robber.*)
            ) AS AVGRobberies
        FROM Robbers robber
            NATURAL JOIN (
                SELECT RobberId,
                    COUNT(RobberId) AS robberyTimes
                FROM Accomplices a
                GROUP BY robberid
                ORDER BY Robberid
            ) SB
        WHERE NoYears = 0
    ) avg
    NATURAL JOIN Accomplices a
    NATURAL JOIN Robbers r
WHERE avg.AVGRobberies < SB.robberyTimes
    AND noYears = 0
GROUP BY RobberId,
    Nickname
ORDER BY TotalEarning DESC;