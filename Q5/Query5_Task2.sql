SELECT DISTINCT robber.RobberId,
    robber.Nickname
FROM Robbers robber
    INNER JOIN HasAccounts hasAccount USING(RobberId)
WHERE NOT EXISTS(
        SELECT 1
        FROM Accomplices accomplice
        WHERE accomplice.RobberId = robber.RobberId
            AND accomplice.BankName = hasAccount.BankName
            AND accomplice.City = hasAccount.City
    )
ORDER BY robber.RobberId;