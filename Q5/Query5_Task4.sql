SELECT robbery.BankName,
    robbery.City,
    robbery.Date,
    temp.HighestShare
FROM Robberies robbery
    NATURAL JOIN(
        SELECT city,
            MAX(amount) AS HighestShare
        FROM Robberies
        GROUP BY city
        ORDER BY MAX(amount)
    ) temp
WHERE robbery.amount = temp.HighestShare
ORDER BY robbery.City;