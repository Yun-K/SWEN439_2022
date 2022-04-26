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