SELECT hs.RobberId,
    robber.Nickname,
    -- hs.Preference,
    -- temp.skillNums,
    skill.Description
FROM Robbers robber
    NATURAL JOIN Hasskills hs
    NATURAL JOIN Skills skill
    NATURAL JOIN(
        -- remove robbers who do NOT have 2 or more skills
        SELECT robberid,
            COUNT(robberid) AS skillNums
        from HasSkills
        GROUP BY robberid
        HAVING COUNT(robberid) >= 2
    ) temp
WHERE hs.Preference = 1
ORDER BY hs.RobberId;