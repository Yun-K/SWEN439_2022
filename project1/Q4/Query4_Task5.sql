SELECT robber.RobberId,
    robber.Nickname,
    temp.TotalEarning
FROM Robbers robber
    JOIN (
        SELECT RobberId,
            SUM(Share) AS TotalEarning
        FROM Accomplices
        GROUP BY RobberId
    ) temp on temp.RobberId = robber.RobberId
WHERE temp.TotalEarning > 40000
ORDER BY temp.TotalEarning DESC;
-- Or 
SELECT robber.RobberId,
    robber.Nickname,
    SUM(accomplice.Share) AS TotalEarning
FROM Accomplices accomplice,
    Robbers robber
WHERE robber.RobberId = accomplice.RobberId
GROUP BY robber.RobberId,
    robber.Nickname
HAVING SUM(accomplice.Share) > 40000
ORDER BY TotalEarning DESC;