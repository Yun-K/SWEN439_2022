-- 2.	The police department wants to know whether bank branches with lower security levels are more attractive for robbers than those with higher security levels. 
-- Construct a view containing the Security level, the total Number of robberies that occurred in bank branches of that security level, and the average Amount of money that was stolen during these robberies. 
-- 
-- 
-- First, construct the view 
DROP VIEW securityWithAVG;
DROP VIEW securityWithSumCount;
CREATE VIEW securityWithSumCount AS(
    SELECT bank.Security,
        COUNT(robbery.*) AS RobberiesNumber,
        SUM(robbery.Amount) AS TotalMoney
    FROM Robberies robbery
        INNER JOIN Banks bank USING(BankName, City)
    GROUP BY bank.security -- ORDER BY bank.security
);
CREATE VIEW securityWithAVG AS(
    SELECT sumView.Security,
        sumView.RobberiesNumber,
        (sumView.TotalMoney / sumView.RobberiesNumber) AS AverageMoneyAmount
    FROM securityWithSumCount sumView -- ORDER BY sumView.Security
);
SELECT *
FROM securityWithAVG;
-- 
-- 
-- 
SELECT CTE.Security,
    CTE.RobberiesNumber,
    (CTE.TotalMoney / CTE.RobberiesNumber) AS AverageMoneyAmount
FROM (
        SELECT bank.Security,
            COUNT(robbery.*) AS RobberiesNumber,
            SUM(robbery.Amount) AS TotalMoney
        FROM Robberies robbery
            NATURAL JOIN Banks bank
        GROUP By bank.Security -- ORDER BY bank.Security
    ) CTE;