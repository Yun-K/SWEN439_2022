SELECT robber.RobberId,
    robber.Nickname,
    (robber.Age - robber.NoYears) AS NotInPrisonYears
FROM Robbers robber
WHERE robber.NoYears > (robber.Age / 2);