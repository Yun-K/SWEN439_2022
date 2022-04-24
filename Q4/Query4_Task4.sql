SELECT BankName,
    City,
    NoAccounts
FROM Banks bank
WHERE City != 'Chicago'
ORDER BY NoAccounts ASC;