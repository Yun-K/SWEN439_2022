SELECT a.bankName,
    a.city
FROM Robbers r
    NATURAL JOIN Accomplices a
    NATURAL JOIN(
        --  annoying, spend me lots of time, 
        -- it will find the number of the bank that has been robbed from different robbers. WHich means no matter how many times a robber rob this specificed banks, it will count only once.
        SELECT a1.BankName,
            a1.City,
            COUNT(DISTINCT a1.RobberId) AS robbedCounts
        FROM Accomplices a1
        GROUP BY BankName,
            City
        ORDER BY robbedCounts
    ) temp
    NATURAL JOIN (
        Select Count(*) as robberNumbers
        From Robbers
    ) temp1
WHERE temp.robbedCounts = temp1.robberNumbers
ORDER BY a.robberId;