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