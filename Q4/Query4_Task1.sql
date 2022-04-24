SELECT bank.BankName,
    bank.City
FROM Banks bank
WHERE NOT EXISTS(
        SELECT 1
        FROM Robberies robbery
        WHERE robbery.BankName = bank.BankName
            AND robbery.City = bank.City
    );
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-exists/