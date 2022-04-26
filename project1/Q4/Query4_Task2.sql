SELECT robber.RobberId,
    robber.NickName,
    robber.Age,
    skill.Description
FROM Robbers robber,
    Skills skill,
    HasSkills hasSkill
WHERE robber.Age > 40
    AND robber.RobberId = hasSkill.RobberId
    AND skill.SkillId = hasSkill.SkillId;