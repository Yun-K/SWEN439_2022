SELECT DISTINCT bank.BankName,
    bank.City
FROM Banks bank
    INNER JOIN HasAccounts acc USING(BankName, City)
    INNER JOIN Robbers robber USING(RobberId)
WHERE acc.RobberId = robber.RobberId
    AND robber.NickName = 'Al Capone';
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-natural-join/