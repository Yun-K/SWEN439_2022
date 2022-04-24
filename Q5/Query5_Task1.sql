SELECT DISTINCT plan.BankName,
    plan.City
FROM Plans plan
WHERE NOT EXISTS(
        SELECT 1
        FROM Robberies robbery
        WHERE extract(
                year
                from plan.PlannedDate
            ) = extract(
                year
                from robbery.Date
            )
            AND plan.BankName = robbery.BankName
            AND plan.City = robbery.City
    );