SELECT robber.RobberId,
    robber.NickName,
    skill.Description
FROM Robbers robber
    INNER JOIN HasSkills hasSkill USING (RobberId)
    INNER JOIN Skills skill USING(SkillId)
ORDER BY skill.Description;